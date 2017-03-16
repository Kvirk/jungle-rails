class ProductsController < ApplicationController
  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    puts "\n\n\n\n\n\n\n"
    @reviews = Review.where(product_id: params[:id]).pluck(:user_id, :description, :rating)
  end

end
