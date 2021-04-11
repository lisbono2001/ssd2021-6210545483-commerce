class ReviewsController < ApplicationController
    http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

    def create
      @product = Product.find(params[:product_id])
      @review = @product.reviews.create(review_params)
      redirect_to product_path(@product)
    end

    def destroy
      @product = Product.find(params[:product_id])
      @review = @product.reviews.find(params[:id])
      @review.destroy
      redirect_to product_path(@product)
    end
  
    private
      def review_params
        params.require(:review).permit(:reviewer, :body, :status)
      end
end
