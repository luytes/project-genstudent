class PaymentsController < ApplicationController
  before_action :set_order
  # IT TAKES 3-4 DAYS TILL WE CAN ASSIGN HIM A STUDENT
  def new
  end

  def create
    @user = current_user

    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail],
    )
    # Storing the customer.id in the customer_id field of user
    if @user.customer_id.nil?
      @user.customer_id = customer.id
    else
      @user.customer_id
    end

    begin
      @plan = Stripe::Plan.retrieve(@order.service.title)
    rescue
      @plan = Stripe::Plan.create(
        :name => @order.service.title,
        :id => @order.service.title,
        :interval => "month",
        :currency => @order.amount.currency,
        :amount => @order.amount_pennies,
      )
    end

    unless @plan
      @plan = Stripe::Plan.create(
        :name => @order.service.title,
        :id => @order.service.title,
        :interval => "month",
        :currency => @order.amount.currency,
        :amount => @order.amount_pennies,
      )
    else
      subscription = Stripe::Subscription.create(
        :customer => @user.customer_id,
        :plan => @order.service.title
      )
    end

    @user.update(customer_id: @user.customer_id)
    @order.update(payment: @plan.to_json, state: 'paid', customer: @user.customer_id)
    redirect_to order_path(@order)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_order_payment_path(@order)
  end

  def destroy
    @user = current_user
    @subscription = @user.subscription.where()
    subscription = Stripe::Subscription.retrieve("sub_3R3PlB2YlJe84a")
    subscription.delete
    if @user.cancel_user_plan(params[:customer_id])
      @user.update_attributes(customer_id: nil, plan_id: 1)
      flash[:notice] = "Canceled subscription."
      redirect_to dashboard_path
    else
      flash[:error] = "There was an error canceling your subscription. Please notify us."
      redirect_to dashboard_path
    end
  end

  private

  def set_order
    @order = Order.where(state: 'pending').find(params[:order_id])
  end
end
