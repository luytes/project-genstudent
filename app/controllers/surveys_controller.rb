class SurveysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)
    # authorize @survey
    if @survey.save!
      flash[:thanks] = "Thank you for your submission!"
      redirect_to root_path
    else
      render :new
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
                                    :subcategory, :budget, :presence,
                                    :email, :phone)
  end
end
