class StudentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_filter :authorize_admin, except: [:index, :show]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
    10.times do
      @student.services.new
    end
  end

  def create
    @student = Student.new(student_params)
    @student.student_picture = "default-user.png" if student_params[:student_picture].nil?

    # authorize @student
    if @student.save!
      redirect_to dashboard_path
    else
      render 'new', notice: "Failed"
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
      redirect_to student_path(@student)
    else
      render :edit
    end
  end

  def destroy
    @student.destroy!
    respond_to do |format|
      format.js do
        redirect_to dashboard_path, notice: "Successfully Deleted"
      end
      format.html do
        redirect_to dashboard_path
      end
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
    # authorize @student
  end


  def student_params
    params.require(:student).permit(:first_name, :last_name, :introduction,
                                    :subject, :student_picture, :year,
                                    :university, :degree, :skills, :email,
                                    :services_attributes => [:title, :category, :description, :picture])
  end

end
