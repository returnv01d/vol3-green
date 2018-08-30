class DailyMeal < ApplicationRecord
  belongs_to :catering
  belongs_to :meal
  has_many :food_requests

  def is_allergic?(user_allergies)
    self.meal.is_allergic?(user_allergies)
  end
end
