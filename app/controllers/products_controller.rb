class ProductsController < StoreController
  before_action :load_product, only: [:edit, :show, :update, :destroy]

  def index
    @products = @store.products
  end

  def new
    @product = @store.products.new
  end

  def create
    @product = @store.products.new(product_params)

    p " @product "
    p @product

    if @product.save
      redirect_to edit_product_path(@product), notice: 'Producto creado'
    else
      p " @product errors "
      p @product.errors
      render :new
    end
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to edit_product_path(@product), notice: 'Producto creado'
  end

  private

  def load_product
    @product = @store.products.find(params[:id])
  end

  def product_params
    params
      .require(:product)
      .permit(:name, :sku, :description, :cost_price, :store_id)
  end
end
