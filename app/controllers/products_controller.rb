
class ProductsController < ApplicationController
  before_action :authorized, except: [:index, :show, :admins]
  before_action :set_product, only: %i[ show edit update destroy ]

  def index
    @products = Product.all.where(status: "public")

    respond_to do |format|
      format.html
      format.csv {send_data generate_csv(Product.all), file_name: 'products.csv'}
    end
  end

  def show
  end

  def myindex
    @products = Product.all.where(owner: current_user.email)
  end

  def allproducts
    @products = Product.all

    respond_to do |format|
      format.html
      format.csv {send_data generate_csv(Product.all), file_name: 'products.csv'}
    end
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

  def generate_csv(products)
    products.map do |product|
      [product.name, product.description,product.price, product.stock, product.status].join(',')
    end.join("\n")
  end

  def delete_image_attachment
    @space_image = ActiveStorage::Attachment.find(params[:id])
    @space_image.purge
    redirect_back(fallback_location: request.referer)
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :price, :stock, :owner, :status, :image, :category_ids=>[], :support_image=>[])
    end
end