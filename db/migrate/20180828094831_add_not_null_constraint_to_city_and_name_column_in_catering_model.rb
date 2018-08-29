class AddNotNullConstraintToCityAndNameColumnInCateringModel < ActiveRecord::Migration[5.2]
  def up
    change_column :caterings, :name, :string, null: false
    change_column :caterings, :city, :string, null: false
  end
  def down
    change_column :caterings, :name, :string
    change_column :caterings, :city, :string
  end
end
