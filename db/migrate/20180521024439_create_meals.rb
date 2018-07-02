class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.date :date
      t.integer :time
      t.integer :location
      t.integer :p_num, null: false, defautl: 1
      t.references :foreigner

      t.timestamps null: false
    end
  end
end
