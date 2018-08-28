class CreateDietsIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :diets_ingredients do |t|
      t.belongs_to :diet, index: true
      t.belongs_to :ingredient, index: true
    end

  end
end
