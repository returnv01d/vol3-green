class FoodRequest < ApplicationRecord

  belongs_to :user
  belongs_to :daily_meal
  delegate :catering, to: :daily_meal

end
