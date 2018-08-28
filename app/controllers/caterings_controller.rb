class CateringsController < ApplicationController

	def index
    @caterings = Catering.all
	end

	def show
		begin @catering = Catering.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			record_not_found()
		end
    @daily_meals_today = DailyMeal.where("catering_id = ? AND serving_day = ?" ,@catering.id, Date.today).take(10)
	end

	private

	def record_not_found
		redirect_to root_path
		flash[:alert] = "No such catering"
	end

end
