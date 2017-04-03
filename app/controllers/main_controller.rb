class MainController < ApplicationController

    def index
      @category = Category.all
      @productAllWeek = Product.where(
          'created_at >= :five_days_ago or updated_at >= :three_days_ago',
          :five_days_ago  => Time.now - 5.days,
          :three_days_ago => Time.now - 3.days
      )



      if params[:search]
        # @product = Product.where("name LIKE '%#{params[:search]}%' OR description LIKE '%#{params[:search]}%'").page(params[:page]).per(2)
        if params[:category_id] == "all"
        # @product = Product.where("category_id = #{ params[:category_id] }").page(params[:page]).per(2)
          @product = Product.where("name LIKE '%#{params[:search]}%' OR description LIKE '%#{params[:search]}%'").page(params[:page]).per(2)
        else
          @product = Product.where("name LIKE '%#{params[:search]}%' AND category_id LIKE '%#{params[:category_id]}%'").page(params[:page]).per(1)
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
