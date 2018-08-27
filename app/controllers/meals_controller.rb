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
    # @meal = Meal.find(params[:id])
    # The catering service can edit a specific meal
    # (as in, its ingredients)
  end
end
