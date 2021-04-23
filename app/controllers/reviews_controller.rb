class ReviewsController < ApplicationController
  before_action :set_product, only: %i[ create destroy ]

  def create
    @review = @product.reviews.create(review_params)
    redirect_to product_path(@product)
  end

  def destroy
    @review = @product.reviews.find(params[:id])
    @review.destroy
    redirect_to product_path(@product)
  end

  private
    def review_params
      params.require(:review).permit(:reviewer, :body)
    end
end
