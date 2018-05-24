class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.references :match, index: { unique: true }, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
