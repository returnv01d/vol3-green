class CreateDailyMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_meals do |t|
      t.date :serving_day
      t.belongs_to :catering
      t.belongs_to :meal
      t.timestamps
    end
  end
end
