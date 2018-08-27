class Catering < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :meals
  has_and_belongs_to_many :users,
                          class_name: 'User' ,
                          foreign_key: 'catering_id',
                          join_table: :subscriptions
end
