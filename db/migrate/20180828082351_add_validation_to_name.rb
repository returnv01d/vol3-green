class AddValidationToName < ActiveRecord::Migration[5.2]
  def up
    change_column :ingredients, :name, :string, unique: true, null: false
  end

  def down
    change_column :ingredients, :name, :string, null: false
  end
end
