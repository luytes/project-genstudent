class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.all
    # @category = @services.first.category unless @services.empty?
    @categories = @services.map { |p| p.category }.uniq

  end

  def show
  end

  def new
    @service = Service.new
    @student = Student.find(params[:id])
    @service.student = @student
  end

  def create
    @service = Service.new(service_params)
    @service.picture = "chemi.jpg"  if service_params[:picture].nil?
    @student = Student.find(params[:id])
    @service.student = @student
    # authorize @service
    if @service.save
      render :new
    else
      redirect_to new_service_path
    end
  end

  def edit
  end

  def update
    if @service.update(service_params)
      redirect_to service_path(@service)
    else
      render :edit
    end
  end

  def destroy
    @service.destroy
  end

  private

  def set_service
    @service = Service.find(params[:id])
    # authorize @service
  end


  def service_params
    params.require(:service).permit(:title, :category, :description,
                                    :rating, :student_id, :picture)
  end

end
