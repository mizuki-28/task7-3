class UsersController < ApplicationController
  
  before_action :authenticate_user!

  def account
    @user = current_user
  end

  def profile
    @user = current_user
  end

  def update_profile
    @user = current_user
    if @user.update(current_user_params)
      flash[:notice] = "プロフィールを更新しました"
    else
      flash[:alert] = "プロフィールを更新できませんでした"
    end
    redirect_to users_profile_path
  end

  private

  def current_user_params
    params.require(:user).permit(:user_name, :about, :user_image)
  end

end