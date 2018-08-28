class CreateFoodRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :food_requests do |t|
      t.boolean :is_autorequested, null: false, default: false
      t.belongs_to :user, index: true
      t.belongs_to :daily_meal, index: true
      t.timestamps
    end
  end
end
