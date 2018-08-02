class Product < ApplicationRecord
  validates :name, :description, :image_url, presence: true
end
