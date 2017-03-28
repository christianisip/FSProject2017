class Product < ApplicationRecord
  # attr_accessible :products, :name, :image
  mount_uploader :image, ImageUploader


end
