class Meal < ApplicationRecord
  belongs_to :catering
  validates :name,
    presence: true,
    format: { with: /\A[a-zA-Z0-9]+\z/, message: 'only allows letters and numbers' }
  validates :catering, presence: true 
end
