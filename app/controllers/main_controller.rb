class MainController < ApplicationController
    before_action :initialize_session
    def index
      @testProduct = Product.all
      if params[:search]
        # @product = Product.where("name LIKE '%#{params[:search]}%' OR description LIKE '%#{params[:search]}%'").page(params[:page]).per(2)
        if params[:category_id] == "all"
        # @product = Product.where("category_id = #{ params[:category_id] }").page(params[:page]).per(2)
          @product = Product.where("name LIKE '%#{params[:search]}%' OR description LIKE '%#{params[:search]}%'").order(:name).page(params[:page]).per(2)
        else
          @product = Product.where("name LIKE '%#{params[:search]}%' AND category_id LIKE '%#{params[:category_id]}%'").page(params[:page]).per(1)
        end
      elsif params[:category_type]
        @product = Product.where("category_id = #{params[:category_type]}").order(:name).page(params[:page]).per(3)
      else
        @product = Product.all.page(params[:page]).per(3)
      end
  end

  def display
    @category = Category.all
    @product = Product.find(params[:number].to_i)
  end

  def newproduct
    @newproduct = Product.where(
        'created_at >= :five_days_ago',
        :five_days_ago  => Time.now - 4.days
    ).page(params[:page]).per(3)
    @recentlyproduct = Product.where(
        'updated_at >= :five_days_ago',
        :five_days_ago  => Time.now - 5.days
    ).page(params[:page]).per(3)
  end

  def recentlyproduct
    @newproduct = Product.where(
        'created_at >= :five_days_ago',
        :five_days_ago  => Time.now - 4.days
    ).page(params[:page]).per(3)
    @recentlyproduct = Product.where(
        'updated_at >= :five_days_ago',
        :five_days_ago  => Time.now - 5.days
    ).page(params[:page]).per(3)
  end

  def login
    if params[:username]
      User.create!(username: params[:username],
                  firstname: params[:firstname],
                  lastname: params[:lastname],
                  password: params[:password],
                  address: params[:address],
                  province_id: params[:province_id],
                  email: params[:email],
                  phonenumber: params[:phonenumber]
                  )
    end
  end

  def cart
    @addcart = Product.find(session[:to_cart_list])
    @qtyproduct = params[:quantity]
  end

  def remember_to_cart
    id = params[:id].to_i
    session[:to_cart_list] << id unless session[:to_cart_list].include?(id)
    redirect_back(fallback_location: cart_path)
  end

  def delete_to_cart
    id = params[:id].to_i
    session[:to_cart_list].delete(id)
    redirect_back(fallback_location: cart_path)
     flash[:notice] = "Delete successfully"
  end

  def contact
    @contact = Information.all
  end

  def about
    @about = Information.all
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
