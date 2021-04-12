class ProductsController < ApplicationController

  before_action :authorized, except: [ :index, :show ]

  def index
    @products = Product.all
    # @products = Product.all.where(status: "public")
  end

  def show
    @product = Product.find(params[:id])
  end

  def myindex
    @products = Product.all.where(owner: current_user.email)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to root_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :price, :stock, :owner, :status)
    end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to "/login" unless logged_in?
  end
  
end
