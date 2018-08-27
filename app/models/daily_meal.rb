class DailyMeal < ApplicationRecord
  belongs_to :catering
  belongs_to :meal
end
