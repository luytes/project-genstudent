class OrdersController < ApplicationController
  def create
    @service = Service.find(params[:service_id]) # i.e. 2
    @order = Order.create!(amount: @service.price, state: 'pending', service_id: @service.id)
    @order.service = @service

    redirect_to new_order_payment_path(@order)
  end
  def show
    @order = Order.where(state: 'paid').find(params[:id])
  end

  # private

  # def order_params
  #   params.require(:order).permit(:service_sku, :amount, :state, :service_id)
  # end
end
