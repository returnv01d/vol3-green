class UsersController < ApplicationController

  def new_allergic_prefs
    current_user = User.find(2)
    @user = current_user
    @add_allergies = current_user.allergies || []


  end

  def create_allergic_prefs
      # @allergic_prefs =

      if current_user.update(user_params)
        flash[:notice] = "You have created your preferences successfully!"
        redirect_to root_path
      else
        # render :new_allergic_prefs
        redirect_to users_new_allergic_prefs_path
        flash[:alert] = "Preferences not saved!"
      end


  end

  def edit_allergic_prefs
  end

  def delete_allergic_prefs
  end

  private

  def user_params
    params.require(:user).permit(allergy_ids: [])
  end
end
