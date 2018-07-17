class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.date :date
      t.integer :time
      t.integer :location
      t.integer :male, null: false, defautl: 0
      t.integer :female, null: false, defautl: 0
      t.text :note
      t.references :foreigner

      t.timestamps null: false
    end
  end
end
