class CreateUserRegistrations < ActiveRecord::Migration[8.0]
  def change
    create_table :user_registrations do |t|
      t.references :user, index: { unique: true }, null: true, foreign_key: true
      t.string :email, null: false
      t.string :token, null: false, index: { unique: true }
      t.datetime :expires_at, null: false

      t.timestamps
    end
  end
end
