# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  bio             :text
#  birthday        :date
#  city            :string
#  country         :string
#  email           :string           not null
#  facebook        :string
#  first_name      :string
#  gender          :string           not null
#  instagram       :string
#  last_name       :string
#  password_digest :string           not null
#  session_token   :string           not null
#  state           :string
#  twitter         :string
#  username        :string           not null
#  website         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  avatar_id       :integer
#
# Indexes
#
#  index_users_on_avatar_id      (avatar_id)
#  index_users_on_email          (email) UNIQUE
#  index_users_on_session_token  (session_token) UNIQUE
#  index_users_on_username       (username) UNIQUE
#

class User < ApplicationRecord
    attr_reader :password

    validates :username, :session_token, :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :gender, :password_digest, presence: true
    validates :password, length: { minimum: 8, allow_nil: true }

    after_initialize :ensure_session_token

    def self.find_by_credentials(email, password)
      user = User.find_by(email: email)
      return nil unless user
      user.is_password?(password) ? user : nil
    end

    def password=(password)
      @password = password
      self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
      BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def ensure_session_token
      self.session_token ||= SecureRandom.urlsafe_base64
    end

    def reset_session_token!
      self.session_token = SecureRandom.urlsafe_base64
      self.save
      self.session_token
    end
end
