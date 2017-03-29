class MainController < ApplicationController

    def index

      @category = Category.all

      if params[:search]
            @product = Product.where('name LIKE ?', "%#{params[:search]}%")
      elsif params[:category_id]
        @product = Product.where("category_id = #{ params[:category_id] }")
      else
        @product = Product.all
      end
    end

    def display
    @category = Category.all
    @product = Product.find(params[:number].to_i)
  end

end
