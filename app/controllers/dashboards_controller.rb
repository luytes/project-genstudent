class DashboardsController < ApplicationController
  # skip_after_action :verify_authorized
  def show
    @user = current_user
    if @user.profile_picture.nil?
      @user.profile_picture = "chemie.jpg"
    end
    @students = Student.all
    @orders = Order.all
    @order = Order.where(state: 'active') # gives me all the active orders
    @hash = @order.where(customer: @user.customer_id).map do |hash|
      hash.service #creates an array of service objects
    end
    @surveys = Survey.all

    if @user.admin == true
      @services = Service.all
    else
      @services = @hash
    end
    # @requests = Request.where(user: current_user)
  end

  private

  # def request_status(request)
  #   if request.user_confirm && request.owner_confirm
  #     return "joined"
  #   elsif request.user_confirm.nil? || request.owner_confirm.nil?
  #     return "pending"
  #   elsif !request.user_confirm || !request.owner_confirm
  #     return "declined"
  #   end
  # end

  # helper_method :request_status
end

