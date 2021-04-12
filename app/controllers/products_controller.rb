class ProductsController < ApplicationController

  before_action :authorized, except: [ :index, :show ]

  def index
    @products = Product.all.where(status: "public")
    respond_to do |format|
      format.html
      format.csv {send_data generate_csv(Product.all), file_name: 'products.csv'}
    end
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
 
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to root_path
  end

  def csv_upload
    data = params[:csv_file].read.split("\n")
    data.each do |line|
      attr = line.split(",").map(&:strip)
      Product.create name: attr[0], description: attr[1], price: attr[2], stock: attr[3], status: "public", owner: current_user.email
    end
    redirect_to root_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :price, :stock, :owner, :status, :category_ids=>[])
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

  def generate_csv(products)
    products.map do |product|
      [product.name, product.description,product.price, product.stock, product.status].join(',')
    end.join("\n")
  end
end
