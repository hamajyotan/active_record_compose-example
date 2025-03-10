class CreateUserCredentials < ActiveRecord::Migration[8.0]
  def change
    create_table :user_credentials do |t|
      t.references :user, index: { unique: true }, null: false, foreign_key: true
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :token, null: false

      t.timestamps
    end
  end
end
