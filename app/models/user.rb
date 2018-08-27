class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_and_belongs_to_many :allergies,
                          class_name: 'Ingredient' ,
                          foreign_key: 'user_id',
                          join_table: :user_allergies
end
