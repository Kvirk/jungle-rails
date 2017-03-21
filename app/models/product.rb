class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :review
  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true
  validate :category_id_exists

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

  def sold_out?
    quantity == 0
  end

  private

  def category_id_exists
    return throw(:abort) if Category.find_by_id(self.category_id).nil?
  end

end
