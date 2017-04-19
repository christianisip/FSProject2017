class Product < ApplicationRecord
  belongs_to :category
  mount_uploader :image, ImageUploader

  validates :name, :price, presence: true
  validates :mfr, uniqueness: true
  def self.a_s(search)
    where("name LIKE '%#{search}%' OR description LIKE
                              '%#{search}%'")
  end

  def self.a_c(search, category_id)
    where("name LIKE '%#{search}%' AND category_id
                              LIKE '%#{category_id}%'")
  end

  def self.a_cl(category_type)
    where("category_id = #{category_type}")
  end
end
