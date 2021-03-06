class SurveysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)
    # authorize @survey
    if @survey.save!
      UserMailer.new_task(@survey).deliver_now
      flash[:thanks] = "Thank you for your submission! We will be in touch within 24h."
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
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
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :category, :description,
                                    :subcategory, :budget,:budget_month, :presence,
                                    :email, :phone)
  end
end
