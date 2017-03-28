class Product < ApplicationRecord
  # attr_accessible :products, :name, :image
  mount_uploader :image, ImageUploader
  attr_writer :remove_image
  attr_accessor :remove_image

end
