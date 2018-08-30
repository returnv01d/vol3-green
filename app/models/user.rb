class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_and_belongs_to_many :allergies,
  class_name: 'Ingredient' ,
  foreign_key: 'user_id',
  join_table: :users_allergies
  has_and_belongs_to_many :caterings,
  class_name: 'Catering' ,
  foreign_key: 'user_id',
  join_table: :subscriptions
  has_and_belongs_to_many :diets,
  class_name: 'Diet',
  foreign_key: 'user_id',
  join_table: :users_diets
  has_many :food_requests

  DEFAULT_DIET_NAME = 'Meat'.freeze

  def default_diet
    Diet.find_or_create_by(name: DEFAULT_DIET_NAME)
  end

  def has_ordered_food_today?
    if self.food_requests.where('created_at BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now).first != nil
      return true
    end
    false
  end

  after_create do |user|
    user.diets << default_diet
  end
end
