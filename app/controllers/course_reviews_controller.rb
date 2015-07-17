class CourseReviewsController < ApplicationController
  def new
    @review = CourseReview.new
  end

  def create
    @review = CourseReview.new(course_reviews_params)
    @review.course = params[:course_id] if params[:course_id]
    if @review.save
      flash[:message] = "Thank you for your feedback!"
    else
      flash[:message] = "We encountered a problem with saving your review! Sorry!"
    end
    redirect_to courses_path
  end

  protected

  def course_reviews_params
    params.require(:course_review).permit(:name, :body, :course_id)
  end
end
