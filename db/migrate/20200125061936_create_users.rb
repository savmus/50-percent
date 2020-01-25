class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :avatar_id
      t.string :username, null: false
      t.string :email, null: false
      t.string :session_token, null: false
      t.string :password_digest, null: false
      t.string :gender, null: false
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.text :bio
      t.string :city
      t.string :state
      t.string :country
      t.string :website
      t.string :twitter
      t.string :facebook
      t.string :instagram

      t.timestamps
    end
    add_index(:users, :avatar_id)
    add_index(:users, :username, unique: true)
    add_index(:users, :email, unique: true)
    add_index(:users, :session_token, unique: true)
  end
end
