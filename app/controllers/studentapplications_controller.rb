class StudentapplicationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :create, :new]
  def index
  end

  def new
    @studentapplication = Studentapplication.new
  end

  def create
    @studentapplication = Studentapplication.new(studentapplication_params)
    if @studentapplication.save!
      UserMailer.new_application(@studentapplication).deliver_now
      UserMailer.new_student_application_notice(@studentapplication).deliver_now
      flash[:thanks] = "Thank you for your application! We will be in touch within 24h."
      redirect_to studentapplications_path
    else
      render :new
    end
  end

  private

  def studentapplication_params
    params.require(:studentapplication).permit(:first_name, :last_name, :email,
                                    :sex, :country, :city, :university,
                                    :major, :skills, :cv)
  end

end
