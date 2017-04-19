class MainController < ApplicationController
  before_action :initialize_session

  def index
    @product = Product.all.page(params[:page]).per(3)
    if params[:search]
      if params[:category_id] == 'all'
        @product = Product.a_s(params[:search]).order(:name).page(params[:page]).per(2)
      else
        @product = Product.all_c(params[:search], params[:category_id]).page(params[:page]).per(1)
      end
    elsif params[:category_type]
      @product = Product.a_cl(params[:category_type]).order(:name).page(params[:page]).per(3)
    end
  end

  def display
    @category = Category.all
    @product = Product.find(params[:number].to_i)
  end

  def newproduct
    @newproduct = Product.where(
      'created_at >= :five_days_ago', five_days_ago: Time.current - 4.days
    ).page(params[:page]).per(3)
  end

  def recentlyproduct
    @recentlyproduct = Product.where(
      'updated_at >= :five_days_ago', five_days_ago: Time.current - 5.days
    ).page(params[:page]).per(3)
  end

  def register
    return unless params[:username]
    User.create!(
      username: params[:username], firstname: params[:firstname],
      lastname: params[:lastname], password: params[:password], address: params[:address],
      province_id: params[:province_id], email: params[:email], phonenumber: params[:phonenumber]
    )
  end

  # def login
  #   return unless params[:userlogin]
  #   @user = User.find_by("username IS '#{params[:userlogin]}'")
  #   if @user && params[:userlogin] == @user.username && params[:passlogin] == @user.password
  #     session[:user] = @user.username
  #     # session[:province] = @user.province.name
  #     # session[:pst] = @user.province.pst
  #     # session[:gst] = @user.province.gst
  #   else0
  #     redirect_to index_path
  #   end
  # end

  def cart
    @addcart = Product.find(session[:to_cart_list])
    @qtyproduct = params[:quantity]
    session[:totalprice] = 0
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
    flash[:notice] = 'Delete successfully'
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

  def initilize_user_info
    session[:user] = @user.username
    session[:province] = @user.province.name
    session[:pst] = @user.province.pst
    session[:gst] = @user.province.gst
  end
end
