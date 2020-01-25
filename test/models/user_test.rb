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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
