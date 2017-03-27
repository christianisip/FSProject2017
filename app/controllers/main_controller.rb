class MainController < ApplicationController

  def index
    @product = Product.all
    @productCategory = Product.where(tags: 'Motherboard')
  end

  def clean
    @productCategory = Product.where(tags: 'Motherboard')
  end
end
