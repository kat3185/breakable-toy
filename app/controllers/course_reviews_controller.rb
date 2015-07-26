class CourseReviewsController < ApplicationController
  def new
    @review = CourseReview.new
  end

  def create
    @review = CourseReview.new(course_reviews_params)
    if @review.save
      flash[:message] = "Thank you for your feedback!"
    else
      flash[:message] = "We encountered a problem with saving your review! Sorry!"
    end
    redirect_to posts_path
  end

  def index
    @course_reviews = CourseReview.all.page(params[:page])
  end

  protected

  def course_reviews_params
    params.require(:course_review).permit(:name, :body, :course_id)
  end
end
