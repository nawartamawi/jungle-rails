class ReviewsController < ApplicationController
before_filter :authorize 
  def create 
    @review = Review.create!(review_params.merge(
      user_id: current_user.try(:id),
      product_id: params[:product_id] 
    ))
    redirect_to @review.product
  end 

  def destroy
    @review = Review.find params[:id] 
    @product = @review.product
    @review.destroy
    redirect_to @product
  end 

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
