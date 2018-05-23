class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references :meal, foreign_key: true
      # t.references :foreigner, foreign_key: true
      t.references :japanese, foreign_key: true
      t.boolean :ok, default: false
      t.integer :budget

      t.timestamps null: false
    end
  end
end
