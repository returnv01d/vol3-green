class AddDescriptionColumnAndRenameAddresToCityInCatering < ActiveRecord::Migration[5.2]
  def change
    add_column :caterings, :description, :text
    rename_column :caterings, :address, :city
  end
end
