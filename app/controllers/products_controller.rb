class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: "Product created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
    def set_product
        @product = find_by_id
    end

    def find_by_id
      begin
        Product.find(params[:id])
      rescue ActiveRecord::RecordNotFound => err
        logger.debug err
        nil
      end
    end

    def product_params
      puts "### params" + params.inspect
      params.expect(product: [ :name ])
    end
end
