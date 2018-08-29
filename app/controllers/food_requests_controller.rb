class FoodRequestsController < ApplicationController

  def create

    current_user.food_requests.where("created_at BETWEEN ? AND ?", Date.today, Time.now).each do |i|
      i.destroy
    end

    @f = FoodRequest.new(user_id: current_user.id, daily_meal_id: params[:daily_meal_id])
    if @f.save
      redirect_to catering_path(params[:watched_catering])
      flash[:notice] ="win"
    else
      redirect_to catering_path(params[:watched_catering])
      flash[:alert] = "no + #{params[:daily_meal_id]} + #{params[:watched_catering]} + #{current_user.id}"
    end
  end

  private
  def food_request_params
    params.require(:food_request).permit(:daily_meal_id, :watched_catering)
  end

end