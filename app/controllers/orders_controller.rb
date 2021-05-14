class OrdersController < ApplicationController
  before_action :checkadmin, only: [:index]
  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
    @order = Order.find(params[:id])
    @product = Product.find(@order.product_id)
  end

  # GET /orders/new
  def new
    @order = Order.new
    @product = Product.find(params[:product_id])
    @product_id = params[:product_id]
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to @order
    else
        render :new
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:product_id, :address)
  end
end
