class AddFoodOrderCloseTimeToCatering < ActiveRecord::Migration[5.2]
  def change
    add_column :caterings, :food_order_close_time, :string, null: false, default: '10:00'
  end
end
