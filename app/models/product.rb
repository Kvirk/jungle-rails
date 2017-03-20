class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

  def get_average(id)
    @reviews = Review.where(product_id: id).pluck(:rating)
    if !@reviews.any?
      return "No Rating"
    end
    average = 0.0
    @reviews.each do |review|
      average += review
    end
    "#{(average / @reviews.size).round(2)}"
  end

end
