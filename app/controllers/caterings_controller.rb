class CateringsController < ApplicationController
  before_action :authenticate_user!
	def index
    @caterings = Catering.all
	end

	def show
		begin @catering = Catering.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			record_not_found()
		end
    @daily_meals_today = DailyMeal.where(catering: @catering, serving_day: Date.today).all
  end

  def create
    @f = FoodRequest.new(user_id: current_user, daily_meal_id: params[:daily_meal])
    if @f.save
      redirect_to root_path
      flash[:notice] ="win"
    else
      redirect_to catering_path(1)
      flash[:alert] = "no + #{params[:daily_meal]}"
    end
  end


  def create_food_request

  end
	
  private

	def record_not_found
		redirect_to root_path
		flash[:alert] = "No such catering"
	end

end
