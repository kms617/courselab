class CoursesController < ApplicationController

  def index
    @courses = Course.order(title: :desc)
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to courses_path
      flash[:notice] = "Course successfully submitted!"
    else
      flash[:alert] = "There was a problem, please try again."
      render :new
    end
  end

  private

  def course_params
    params.require(:course).permit(:title, :image, :url, :source, :description)
  end

end