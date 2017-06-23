class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.all
    # @category = @services.first.category unless @services.empty?
    # creating an array of categories
    @categories = @services.map { |p| p.category }.uniq
  end

  def show
    @review = Review.new
    @user = current_user
    # Shows me all orders with the service id of the service I am looking at right now
    @order = Order.where(service_id: @service.id)
    if !@order.nil?
      @paid = Order.first #CHANGE THAT!!!!!!!!!!
    end

    count = 0
    # This gives me an aray of hashes with a rating as single key
    @hash = Review.where(service_id: @service.id).map do |hash|
      { rating: hash[:rating] }
    end
    # Now I want to add all the ratings together. i get the rating by writing @hash.first.values[0]
    @total = @hash.each do |val|
      count += val.values[0]
    end
    @number_of_reviews = Review.where(service_id: @service.id).count
    # count gets set to the new value because of @total
    @average = (count.to_f/@number_of_reviews.to_f)
  end

  def new
    @service = Service.new
    @student = Student.find(params[:id])
    @service.student = @student
  end

  def create
    @service = Service.new(service_params)
    # @service.picture = "chemi.jpg"  if service_params[:picture].nil?
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
