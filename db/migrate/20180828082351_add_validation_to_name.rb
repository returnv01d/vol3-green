class AddValidationToName < ActiveRecord::Migration[5.2]
  def change
    change_column :ingredients, :name, :string, unique: true, null: false
  end
end
