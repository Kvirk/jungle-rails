class ReviewsController < ApplicationController
  def create
    @review = Review.new(product_params)

    if @product.save
      redirect_to [:admin, :products], notice: 'Product created!'
    else
      render :new
    end
  end
end
