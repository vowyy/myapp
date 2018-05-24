class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.references :match, foreign_key: true

      t.timestamps null: false
    end
  end
end
