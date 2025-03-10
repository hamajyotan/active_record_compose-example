class CreateUserResignation < ActiveRecord::Migration[8.0]
  def change
    create_table :user_resignations do |t|
      t.references :user, index: { unique: true }, null: false, foreign_key: true
      t.text :reason

      t.timestamps
    end
  end
end
