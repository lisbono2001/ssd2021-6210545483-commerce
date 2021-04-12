class ReviewsController < ApplicationController

    def create
      @product = Product.find(params[:product_id])
      @review = @product.reviews.create(review_params)
      redirect_to product_path(@product)
    end

    http_basic_authenticate_with name: "admin", password: "88998899", except: [:create]

    def destroy
      @product = Product.find(params[:product_id])
      @review = @product.reviews.find(params[:id])
      @review.destroy
      redirect_to product_path(@product)
    end
  
    private
      def review_params
        params.require(:review).permit(:reviewer, :body)
      end
end
