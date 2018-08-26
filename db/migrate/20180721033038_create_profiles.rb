class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :profilable, polymorphic: true, index: true, null: false
      t.text :intro

      t.timestamps
    end
  end
end
