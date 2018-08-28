class DailyMeal < ApplicationRecord
  belongs_to :catering
  belongs_to :meal
  has_many :food_requests
end
