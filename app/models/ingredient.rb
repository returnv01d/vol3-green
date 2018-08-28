class Ingredient < ApplicationRecord
  has_and_belongs_to_many :allergic_users,
                          class_name: 'User' ,
                          foreign_key: 'ingredient_id',
                          join_table: :user_allergies
  validates :name,
    presence: true,
    uniqueness: true,
    allow_blank: false,
    format: { with: /\A[a-zA-Z]+\z/, message: 'only allows letters' }

end
