class ProductsController < ApplicationController
  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @review = Review.new
    @product = Product.find params[:id]
    @reviews = Review.where(product_id: params[:id]).pluck(:id, :product_id, :user_id, :description, :rating)
  end

end
