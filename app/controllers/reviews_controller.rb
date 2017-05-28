class ReviewsController < ApplicationController
  def new
    # we need @service in our `simple_form_for`
    @service = Service.find(params[:service_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `service_id` to asssociate review with corresponding restaurant
    @review.service = Service.find(params[:service_id])
    @review.save
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
