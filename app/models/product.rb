class Product < ApplicationRecord
  validates :name, :description, :image_url, presence: true
  validates :name, uniqueness: true
  validates_numericality_of :price, greater_than_or_equal_to: 1
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\Z}i,
    message: "Must be a URL with GIF, JPG or PNG format"
  }
end
