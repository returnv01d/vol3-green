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
		@catering = Catering.new
	end

	def create
		@catering = Catering.new(catering_params)
		if @catering.save
			redirect_to root_path
			flash[:notice] = "Catering created"
		else
			redirect_to new_catering_path
			flash[:alert] = "Try again!"
		end
	end

	def edit
		@catering = Catering.find_by_id(params[:id])
	end

	def update
		@catering = Catering.find_by_id(params[:id])
		if @catering.update(catering_params)
			redirect_to root_path
			flash[:notice] = "Catering updated"
		else
			redirect_to edit_catering_path
			flash[:alert] = "Try again!"
		end
	end

	def destroy
		@catering = Catering.find_by_id(params[:id])
		@catering.destroy
		flash[:notice] = "Catering destroyed ;'("
	end

	private

	def record_not_found
		redirect_to root_path
		flash[:alert] = "No such catering"
	end

	def catering_params
    params.require(:catering).permit(:name, :city, :description)
	end

end