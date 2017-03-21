class ReviewsController < ApplicationController
  before_filter :authorize

  def create
    @review = Review.new

    # Load the parent resource (incase you have rules)
    @product = Product.find(params[:product_id])
    @review = @product.review.new(review_params)

    @review.user = current_user

    if @review.save
      redirect_to product_path(id: params[:product_id])
    else
      render :login
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to product_path(id: params[:product_id])
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

  def authorize
    if session[:user_id]
      return true
    end
    false
  end
end
