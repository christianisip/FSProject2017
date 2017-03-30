class Product < ApplicationRecord
  belongs_to :category
  mount_uploader :image, ImageUploader

  validates :name, :price, presence: true
  validates :mfr, uniqueness: true
end
