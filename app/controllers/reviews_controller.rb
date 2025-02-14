class ReviewsController < ApplicationController
  before_action :set_product

  def create
    review = @product.reviews.new(review_params)

    if review.save
      redirect_to @product, notice: "Review posted!"
    else
      redirect_to product_path(@product), status: :bad_request
    end
  end

  private
    def set_product
      @product = Product.find(params[:product_id])
    end

    def review_params
      params.expect(review: [ :body ])
    end
end
