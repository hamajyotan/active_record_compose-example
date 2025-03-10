class CreateUserProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :user_profiles do |t|
      t.references :user, index: { unique: true }, null: false, foreign_key: true
      t.string :name, null: false
      t.string :lang, null: false

      t.timestamps
    end
  end
end
