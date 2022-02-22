class ProfilesController < ApplicationController
  before_action :require_login

  def show; end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to profiles_path, success: t('.success')
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end
end
