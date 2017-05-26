class ServicesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.all
  end

  def show
    @user = current_user
  end

  def create
    @service = service.new(service_params)
    @service.picture = "chemi.jpg"  if service_params[:picture].nil?
    @service.user = current_user
    # authorize @service
    if @service.save!
      redirect_to service_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @service.update(service_params)
    redirect_to service_path(@service)
  end

  def new
  end

  def destroy
  end

  private

  def set_service
    @service = Service.find(params[:id])
    # authorize @service
  end


  def service_params
    params.require(:service).permit(:title, :category, :description,
                                    :rating, :user_id, :picture)
  end

end
