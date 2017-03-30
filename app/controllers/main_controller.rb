class MainController < ApplicationController

    def index
      @category = Category.all
      @today = Product.where("created_at >= ?", Time.zone.now.beginning_of_day)

      if params[:search]
        # @product = Product.where("name LIKE '%#{params[:search]}%' OR description LIKE '%#{params[:search]}%'").page(params[:page]).per(2)
        if params[:category_id] == "all"
        # @product = Product.where("category_id = #{ params[:category_id] }").page(params[:page]).per(2)
          @product = Product.where("name LIKE '%#{params[:search]}%' OR description LIKE '%#{params[:search]}%'").page(params[:page]).per(2)
        else
          @product = Product.where("name LIKE '%#{params[:search]}%' AND category_id LIKE '%#{params[:category_id]}%'").page(params[:page]).per(2)
        end
      else
        @product = Product.all.page(params[:page]).per(2)
      end
  end

    def display
      @category = Category.all
      @product = Product.find(params[:number].to_i)
  end

end
