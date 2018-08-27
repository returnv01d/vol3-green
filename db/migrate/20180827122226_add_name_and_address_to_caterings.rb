class AddNameAndAddressToCaterings < ActiveRecord::Migration[5.2]
  def change
    add_column :caterings, :name, :string
    add_column :caterings, :address, :string

  end
end
