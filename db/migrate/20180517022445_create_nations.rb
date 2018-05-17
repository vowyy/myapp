class CreateNations < ActiveRecord::Migration[5.2]
  def change
    create_table :nations do |t|
      t.string :nation
      t.string :flag
      
      t.timestamps
    end
  end
end
