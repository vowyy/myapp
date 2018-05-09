class AddFullnameToJapanese < ActiveRecord::Migration[5.2]
  def change
    add_column :japaneses, :first_name, :string, index: true
    add_column :japaneses, :last_name, :string, index: true
  end
end
