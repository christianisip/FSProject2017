class MainController < ApplicationController

    def index
      @category = Category.all
      @today = Product.where("created_at >= ?", Time.zone.now.beginning_of_day)

      if params[:search]
            @product = Product.where("name LIKE '%#{params[:search]}%' OR description LIKE '%#{params[:search]}%'")
      elsif params[:category_id]
        @product = Product.where("category_id = #{ params[:category_id] }")
      else
        @product = Product.all.page(params[:page]).per(2)
      end
    end

    def display
    @category = Category.all
    @product = Product.find(params[:number].to_i)
  end

end
