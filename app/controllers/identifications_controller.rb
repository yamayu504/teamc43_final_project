class IdentificationsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
  end

  def update
    @user = User.find(params[:user_id])
    if @user.update(user_params)
      redirect_to user_identifications_path
    else
      flash.now[:alert] = '入力内容に誤りがあります。'
      render :index
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :prefecture, :cities, :address, :building_name, :birthday, :birthday, :birthday, :commit, :user_id)
  end
end
