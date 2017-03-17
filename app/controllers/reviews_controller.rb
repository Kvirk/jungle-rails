class ReviewsController < ApplicationController
  before_filter :authorize
  def create
    @review = Review.new
    @review.product_id = params[:product_id].to_i
    @review.user_id = session[:user_id]
    @review.description = review_params[:description]
    @review.rating = review_params[:rating].to_i

    if @review.save
      redirect_to "/products/#{params[:product_id]}"
    else
      render :login
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to "/products/#{params[:product_id]}"
  end

  def authorize
    if session[:user_id]
      return true
    end
    false
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end
end
