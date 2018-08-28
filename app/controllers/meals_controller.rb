class MealsController < ApplicationController

  before_action :authenticate_catering!

  def index
    # The catering service can list all the meals they offer
    @meals = Meal.where(catering: current_catering)
  end

  def show
    # The catering service can display a specific meal
    # with some stats maybe?
    # Times ordered, last ordered, ...
    @meal = Meal.find(params.require(:id))
  end

  def edit
    # The catering service can edit a specific meal
    # (as in, its ingredients)
    @meal = Meal.find(params[:id])
  end

  def new
    @meal = Meal.new
  end

  def create

    @meal = Meal.new(
      name: meal_params[:name],
      catering: current_catering
    )

    if @meal.save
      flash[:success] = "Meal successfully created!"
      redirect_to new_catering_meal_path
    else
      flash[:error] = "Something failed."
      render :new
    end
  end

  private

  def meal_params
    params.require(:meal).permit(:name)
  end
end
