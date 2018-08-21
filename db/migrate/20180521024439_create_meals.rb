class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.date :date
      t.string  :time
      t.references :location
      t.integer :male, null: false, defautl: 0
      t.integer :female, null: false, defautl: 0
      t.text :note
      t.string :food
      t.references :foreigner
      t.boolean :skype

      t.timestamps null: false
    end
  end
end
