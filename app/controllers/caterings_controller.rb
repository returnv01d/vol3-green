class CateringsController < ApplicationController

	def index
		@caterings = Catering.all
	end

	def show
		begin @catering = Catering.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			record_not_found()
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

	def record_not_found
		redirect_to root_path
		flash[:alert] = "No such catering"
	end
end