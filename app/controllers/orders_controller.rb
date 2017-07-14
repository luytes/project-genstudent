class OrdersController < ApplicationController
  def create
    if current_user.email_confirmed == false
      flash[:error] = "Please verify your email in order to continue."
      redirect_back(fallback_location: root_path)
    else
      @service = Service.find(params[:service_id]) # i.e. 2
      @order = Order.create!(amount: @service.price, state: 'pending', service_id: @service.id)
      @order.service = @service
      redirect_to new_order_payment_path(@order)
    end
  end

  def show
    @order = Order.where(state: 'active').find(params[:id])
  end

  # private

  # def order_params
  #   params.require(:order).permit(:service_sku, :amount, :state, :service_id)
  # end
end
