class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  # skip_after_action :verify_authorized

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    user_params
    @user = current_user
    @user.update(user_params)
    if @user.save!
      redirect_to dashboard_path(@user)
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:profile_picture, :profile_picture_cache,
                                 :email, :password, :first_name, :last_name,
                                 :company_name, :company_description, :customer_id, :admin)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
end
