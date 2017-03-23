class Product < ApplicationRecord
  # attr_accessible (previous list), :image #If exists
  mount_uploader :image, ImageUploader
end
