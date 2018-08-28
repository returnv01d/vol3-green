class AddNotNullConstraintToCityAndNameColumnInCateringModel < ActiveRecord::Migration[5.2]
  def change
    change_column :caterings, :name, :string, null: false
    change_column :caterings, :city, :string, null: false
  end
end
