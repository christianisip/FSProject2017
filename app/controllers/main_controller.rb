class MainController < ApplicationController

    def index

      @category = Category.all


      if params[:category_id]
        @product = Product.where("category_id = #{ params[:category_id] }")
      else
        @product = Product.all
      end
    end

end
