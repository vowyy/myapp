class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :profilable_id
      t.string :profilable_type
      t.text :profile

      t.timestamps
    end
  end
end
