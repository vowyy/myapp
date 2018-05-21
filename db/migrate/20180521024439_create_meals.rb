class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.date :date_time
      t.integer :in
      t.integer :p_num
      t.integer :lang
      t.references :foreigner

      t.timestamps null: false
    end
  end
end
