class ReviewsController < ApplicationController
  before_action :set_review

  def new
    # we need @service in our `simple_form_for`
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `service_id` to asssociate review with corresponding service
    @review.service = @service
    if @review.save
      redirect_to service_path(@service)
    else
      render "services/show"
    end
  end

  private

  def set_review
    @service = Service.find(params[:service_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
