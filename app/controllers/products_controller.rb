class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    begin
      @product = find_by_id
    rescue ActiveRecord::RecordNotFound => err
      logger.debug err
    end
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
    @product = find_by_id
  end

  def update
    @product = find_by_id

    if @product.update(product_params)
      redirect_to @product, notice: "Product updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def product_params
      puts "[PARAMS]\n" + params.inspect
      params.expect(product: [ :name ])
    end

    def find_by_id
      Product.find(params[:id])
    end
end
