class OrdersController < ApplicationController
  def create
    @service = Service.find(params[:service_id])
    order  = Order.create!(service_sku: @service.sku, amount: @service.price, state: 'pending')

    redirect_to new_order_payment_path(order)
  end
  def show
    @order = Order.where(state: 'paid').find(params[:id])
  end
end
