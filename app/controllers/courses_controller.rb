class CoursesController < ApplicationController

  def index
    @classes = Course.all[-4..-1]
    # @classes = Course.all
  end

  def show
    @class = Course.find_by(id: params[:id])
  end
end
