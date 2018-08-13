class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references :meal, foreign_key: true
      t.references :japanese, foreign_key: true
      t.boolean :ok, default: false
      t.integer :budget, null: false, default: 0
      t.boolean :skype, null: false, dafault: false

      t.timestamps null: false
    end
      add_index :matches, [:meal_id, :japanese_id], unique: true
  end
end
