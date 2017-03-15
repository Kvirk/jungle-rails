class Admin::CategoriesController < ApplicationController

  def index
    @category = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(product_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Product created!'
    else
      render :new
    end
  end

  def destroy
    # @product = Product.find params[:id]
    # @product.destroy
    # redirect_to [:admin, :products], notice: 'Product deleted!'
  end
  def product_params
    params.require(:category).permit(
      :name
    )
  end

  private

end