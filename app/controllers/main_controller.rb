class MainController < ApplicationController
    before_action :initialize_session
    def index
      @testProduct = Product.all
      @newproduct = Product.where(
          'created_at >= :five_days_ago',
          :five_days_ago  => Time.now - 1.days
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
        @product = Product.all.page(params[:page]).per(5)
      end
  end

  def display
    @category = Category.all
    @product = Product.find(params[:number].to_i)
  end

  def newproduct
    @newproduct = Product.where(
        'created_at >= :five_days_ago',
        :five_days_ago  => Time.now - 1.days
    )
  end

  def login
    if params[:text]
      User.create!(username: params[:text], province_id: '1')
    end
  end

  def cart
    @addcart = Product.find(session[:to_cart_list])
  end

  def remember_to_cart
    id = params[:id].to_i
    session[:to_cart_list] << id unless session[:to_cart_list].include?(id)
    redirect_back(fallback_location: cart_path)
  end

  private

  def initialize_session
    session[:to_cart_list] ||= []
  end

  def products_to_call
    Product.find(session[:to_cart_list])
  end
  helper_method :products_to_call

end
