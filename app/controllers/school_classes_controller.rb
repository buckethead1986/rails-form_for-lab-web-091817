class SchoolClassesController < ApplicationController
  def index
    @classes = SchoolClass.all
  end

  def new
    @class = SchoolClass.new
  end

  def show
    @class = SchoolClass.find(params[:id])
  end

  def create
    @school_class = SchoolClass.new
    @school_class.title = params[:school_class][:title]
    @school_class.room_number = params[:school_class][:room_number]
    @school_class.save

    redirect_to school_class_path(@school_class) #redirect to show method for this instance
  end

  def edit
    @class = SchoolClass.find(params[:id])
  end

  def update
    @class = SchoolClass.find(params[:id])
    @class.update(params[:school_class]) #also works, or the more explicit way in students_controller

    redirect_to school_class_path(@class)

  end

end
