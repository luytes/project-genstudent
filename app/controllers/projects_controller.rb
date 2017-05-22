class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  # skip_after_action :verify_authorized
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
    @user = current_user
    @project_coordinates = { lat: @project.latitude, lng: @project.longitude }
  end

  def new
    @project = current_user.projects.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    @project.picture = "chemi.jpg"  if project_params[:picture].nil?
    @project.user = current_user
    # @project.subcategory = params["subcategory#{@project.category}"]
    authorize @project
    if @project.save!
      redirect_to project_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @project.update(project_params)
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy!
    respond_to do |format|
      format.js do
        redirect_to project_path, notice: "Successfully Deleted"
      end
      format.html do
        redirect_to project_path
      end
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
    authorize @project
  end


  def project_params
    params.require(:project).permit(:title, :full_description, :category, :subcategory,
                                    :short_description, :user_id, :picture, :address, :total_budget)
  end
end
