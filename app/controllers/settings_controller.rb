class SettingsController < ApplicationController
  def edit
    @user = current_user
    render 'devise/registrations/edit'
  end

  def update
    @user = User.find(current_user.id)
    if params[:user][:password].blank?
      params[:user].remove!(:password, :password_confirmation)
    end
    
    if @user.update_attributes(params[:user])
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to edit_user_path
    else
      render 'devise/registrations/edit'
    end
  end
end