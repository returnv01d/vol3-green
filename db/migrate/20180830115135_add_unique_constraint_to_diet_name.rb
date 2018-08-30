class AddUniqueConstraintToDietName < ActiveRecord::Migration[5.2]
  def up
    change_column :diets, :name, :string, null: false, unique: true
  end
  def down
    change_column :diets, :name, :string, null: false
  end

end
