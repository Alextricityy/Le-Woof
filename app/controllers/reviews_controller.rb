class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    authorize @review
    # raise
    @review.user = current_user
    @review.dog_id = params[:dog_id].to_i
    if @review.save
      redirect_to dog_path(params[:dog_id].to_i)
    else
      render "dogs/show"
    end

  end
   private
  def set_review
     @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
