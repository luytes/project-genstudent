class PaymentsController < ApplicationController
  before_action :set_order

  def new
  end

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    @user = current_user

    charge = Stripe::Charge.create(
      customer:     if @user.customer_id.nil?
                      customer.id
                    else
                      @user.customer_id
                    end,
      # You should store this customer id and re-use it. you will have a user model
      # with a stripe customer id colum in the table which may be nil when you never purchased sth.
      amount:       @order.amount_pennies,
      description:  "Payment for service #{@order.service_sku} for order #{@order.id}",
      currency:     @order.amount.currency
    )

    # Storing the customer.id in the customer_id field of user
    @user.customer_id = charge.customer

    @order.update(payment: charge.to_json, state: 'paid')
    redirect_to order_path(@order)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_order_payment_path(@order)
  end

  private

  def set_order
    @order = Order.where(state: 'pending').find(params[:order_id])
  end
end
