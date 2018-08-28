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

	private

	def record_not_found
		redirect_to root_path
		flash[:alert] = "No such catering"
	end

end
