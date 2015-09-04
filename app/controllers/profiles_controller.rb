class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all.page(params[:page])
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path(@user), notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :city_id)
  end
end
