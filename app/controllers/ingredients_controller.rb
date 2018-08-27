class IngredientsController < ApplicationController
  def index
    # The ingredients  can list all the ingredients available
    @ingredients = Ingredient.all
  end
  def create
  # The ingredients service can create a specific ingredient
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.save
    flash[:notice] = "Ingredient added successfully!"
    redirect_to ingredients_path
  end
  def edit
  # The ingredients  service can edit a specific ingredient
  end
  def update
  # The ingredients  service can update a specific ingredient
  end
  def show
  # The ingredients  service can show a specific ingredient
  end
  def new
  # The ingredients  service can update a specific ingredient
    @ingredient = Ingredient.new
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end

end
