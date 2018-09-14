class CreatePrefectures < ActiveRecord::Migration[5.2]
  def change
    create_table :prefectures do |t|
      t.string :name_en
      t.string :name_ja

      t.timestamps
    end
  end
end
