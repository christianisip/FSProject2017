class MainController < ApplicationController

  def index
    @product = Product.all

  end
end
