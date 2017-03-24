class MainController < ApplicationController

  def index
    @product = Product.all
    @productCategory = Product.where(tags: 'CPU')
  end
end
