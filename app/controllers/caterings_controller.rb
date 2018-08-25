class CateringsController < ApplicationController

	def index
		@caterings = Catering.all
	end

	def show
		begin @catering = Catering.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			flash.now.alert = "This Catering does not exist"
			redirect_to :index
		end
	end

	def new
		
	end

	def create
		
	end

	def edit

	end

	def update

	end

	def destroy

	end

	private

	def catering_params
		params.require(:catering).permit(:author, :content)
	end
	rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

	def record_not_found
		redirect_to caterings_path
		flash[:alert] = "No such catering"
	end
end