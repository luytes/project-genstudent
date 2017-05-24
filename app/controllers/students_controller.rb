class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def new
  end

  def destroy
  end

  private

  def set_student
    @student = Student.find(params[:id])
    authorize @student
  end


  def student_params
    params.require(:student).permit(:first_name, :last_name, :category, :desciption,
                                    :cost, :user_id, :student_picture, :rating, :year,
                                    :university, :degree)
  end

end
