class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
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
    # redirect_to edit_user_path(@user)
  end

  def invite
    @request = Request.new
    @request.user = User.find(params[:id])
    @request.owner_confirm = true
    @request.created_by = current_user
    @request.role.project = Project.where()
  end

  private

  # def piece_params
  #   params.require(:piece).permit(:title, :description, :cloudinary_path, :cloudinary_path_cache)
  # end

  def user_params
    params.require(:user).permit(:profile_picture, :profile_picture_cache, :bio,
                                 :email, :password, :skills, :portfolio_url, :first_name,
                                 :last_name, pieces_attributes: [:cloudinary_path])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
end
