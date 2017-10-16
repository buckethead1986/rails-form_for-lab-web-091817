class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new
    @student.first_name = params[:student][:first_name]
    @student.last_name = params[:student][:last_name]
    @student.save
    redirect_to student_path(@student)
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(first_name: params[:student][:first_name])
    @student.update(last_name: params[:student][:last_name])
    @student.save
    redirect_to student_path(@student)
  end


  private
 #dont name it strng params, name it class_params
  def strong_params #will be used in place of params arguments, and inside Student.create instead of Student.new, this is just explicit so I know what is happeneing.
    params.require(:students).permit(:first_name, :last_name) #'alters' hash to always look inside the students nest, permits first and last name to be potential fields.
  end

end
