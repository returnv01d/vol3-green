class UsersController < ApplicationController
  before_action :authenticate_user!

  def new_allergic_prefs
    current_user = User.find(2)
    @user = current_user
  end

  def create_allergic_prefs
      if current_user.update(user_params)
        flash[:notice] = "You have created your preferences successfully!"
        redirect_to users_edit_allergic_prefs_path
      else
        redirect_to users_new_allergic_prefs_path
        flash[:alert] = "Preferences not saved!"
      end
  end

  def edit_allergic_prefs
    # @user = current_user

    @user = current_user
  end

  def delete_allergic_prefs
    if current_user.allergies.delete(allergy_params[:id])
      flash[:notice] = "Ingredient removed successfully!"
      redirect_to users_edit_allergic_prefs_path
    else
      redirect_to users_edit_allergic_prefs_path
      flash[:alert] = "Not removed. Something went wrong!"
    end
  end

  private

  def allergy_params
    params.require(:ingredient).permit(:id)
  end

  def user_params
    params.require(:user).permit(allergy_ids: [])
  end
end
