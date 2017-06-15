class SurveysController < ApplicationController
    def new
      @survey = Survey.new
    end

    def create
      @survey = Survey.new(survey_params)
      # authorize @survey
      if @survey.save!
        render :new
      else
        redirect_to root_path
      end
    end

    private

    def survey_params
      params.require(:survey).permit(:title, :category, :description,
                                      :subcategory, :budget, :presence,
                                      :email, :phone)
    end
end
