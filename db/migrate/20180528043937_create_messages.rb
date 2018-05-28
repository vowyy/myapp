class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text       :content, null: false
      t.references :room
      t.references :foreigner
      t.references :japanese

      t.timestamps null: false
    end
  end
end
