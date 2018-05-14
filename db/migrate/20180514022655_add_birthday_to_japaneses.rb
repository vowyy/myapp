class AddBirthdayToJapaneses < ActiveRecord::Migration[5.2]
  def change
    add_column :japaneses, :birthday, :date
    add_column :japaneses, :intro, :text
    add_column :japaneses, :lang_l, :integer, default: 0, null: false, limit: 1
    add_column :japaneses, :image, :string
  end
end
