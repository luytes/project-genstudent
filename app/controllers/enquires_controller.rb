class EnquiresController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :set_service, only: [:new]

  def new
    @enquire = Enquire.new
  end

  def create
    @enquire = Enquire.new(enquire_params)
    @service = Service.find(params[:enquire][:service_id])
    @enquire.service = @service
    if user_signed_in?
      @user = current_user
    end
    if @enquire.save
      flash[:thanks] = "Thank you for your enquiry! We will be in touch within 24h."
      redirect_to service_path(@service)
    else
      render :new
    end
  end

  def destroy
    @enquire = Enquire.find(params[:id])
    @enquire.destroy
    respond_to do |format|
      format.js do
        redirect_to dashboard_path, notice: "Successfully Deleted"
      end
      format.html do
        redirect_to dashboard_path
      end
    end
  end

  def index
    @enquires = Enquire.all
  end

  def show
    @enquire = Enquire.find(params[:id])
  end

  private

  def set_service
    @service = Service.find(params[:service_id])
  end

  def enquire_params
    params.require(:enquire).permit(:first_name, :last_name, :company,
                                    :message, :email, :phone_number, :service_id )
  end
end
