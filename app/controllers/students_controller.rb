class StudentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def show
    @user = current_user
  end

  def create
    @student = Student.new(student_params)
    @student.picture = "chemi.jpg"  if student_params[:student_picture].nil?
    @student.user = current_user
    # authorize @student
    if @student.save!
      redirect_to student_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @student.update(student_params)
    redirect_to student_path(@student)
  end

  def new
  end

  def destroy
  end

  private

  def set_student
    @student = Student.find(params[:id])
    # authorize @student
  end


  def student_params
    params.require(:student).permit(:first_name, :last_name, :category, :description,
                                    :cost, :user_id, :student_picture, :rating, :year,
                                    :university, :degree)
  end

end
