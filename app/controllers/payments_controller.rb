class PaymentsController < ApplicationController
  before_action :set_order

  # IT TAKES 3-4 DAYS TILL WE CAN ASSIGN HIM A STUDENT
  def new
  end

  def create
    @user = current_user

    # test plan
    # what if the plan already exist? you are creating a new plan here each time with the same id
    # solution: if das nicht existiert also, die plaene mit id, erstlle einen plan mit der id
     # plan = Stripe::Plan.create(
     #  :name => @order.service.title,
     #  :id => @order.service.title,
     #  :interval => "month",
     #  :currency => @order.amount.currency,
     #  :amount => @order.amount_pennies,
     # )


    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail],
    )

    # Storing the customer.id in the customer_id field of user
    @user.customer_id = customer.id

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


    # Charge one time bill

    # charge = Stripe::Charge.create(
    #   customer:     if @user.customer_id.nil?
    #                   customer.id
    #                 else
    #                   @user.customer_id
    #                 end,
    #   # You should store this customer id and re-use it. you will have a user model
    #   # with a stripe customer id colum in the table which may be nil when you never purchased sth.
    #   amount:       @order.amount_pennies,
    #   description:  "Payment for service #{@order.service_sku} for order #{@order.id}",
    #   currency:     @order.amount.currency
    # )

    # Stripe::Subscription.create(
    #   :customer => @user.customer_id,
    #   :plan => @order.service.title,
    # )

    @user.update(customer_id: @user.customer_id)
    @order.update(payment: @plan.to_json, state: 'paid', customer: @user.customer_id)
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
