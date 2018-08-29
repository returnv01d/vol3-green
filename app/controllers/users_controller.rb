class UsersController < ApplicationController
  before_action :authenticate_user!, only:[:edit_diet, :update_diet]
  def create_allergic_prefs
  end

  def edit_allergic_prefs
  end

  def delete_allergic_prefs
  end

  def edit_diet
    current_user = current_user || User.last
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
      redirect_to users_edit_diet_path
    else
      flash[:alert] = "Something went wrong! :C"
      redirect_to users_edit_diet_path
    end
  end

end