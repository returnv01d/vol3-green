class CreateUsersDiets < ActiveRecord::Migration[5.2]
  def change
    create_table :users_diets do |t|
      t.belongs_to :user, index: true
      t.belongs_to :diet, index: true
    end
  end
end
