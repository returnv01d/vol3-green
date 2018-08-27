class CreateUserAllergies < ActiveRecord::Migration[5.2]
  def change
    create_table :user_allergies do |t|
      t.belongs_to :ingredient, index: true
      t.belongs_to :user, index: true
    end
  end
end
