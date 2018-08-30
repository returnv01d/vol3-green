class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit_diet, :update_diet]
  def create_allergic_prefs
  end

  def edit_allergic_prefs
  end

  def delete_allergic_prefs
  end

  def edit_diet
    @diet = current_user.diets.first
  end

  def update_diet
    current_diet = current_user.diets.first.name
    @diet = params[:diets]
    if @diet == nil
      @diet = current_diet
    end
    current_user.diets.clear()
    if current_user.diets << Diet.find_by_name(@diet)
      flash[:notice] = "Your diet is now #{@diet}"
    else
      flash[:alert] = "Something went wrong! :C"
    end
    redirect_to users_edit_diet_path
  end

  def dashboard
    @user = current_user
    @current_food_request = @user.food_requests.
        where('created_at BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now).first
    @user_historic_food_requests = @user.food_requests.
        where('created_at  < ? ', DateTime.now.beginning_of_day)
  end

end