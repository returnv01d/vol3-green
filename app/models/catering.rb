class Catering < ApplicationRecord
	validates :name, :city, presence: true
	has_many :daily_meals
	has_many :meals
end
