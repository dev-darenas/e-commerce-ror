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
    if @product.save
      redirect_to edit_product_path(@product), notice: 'Producto creado'
    else
      render :new
    end
  end

  def edit
    @product.product_option_types.new
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
      .permit(:name, 
        :sku,
        :description,
        :cost_price,
        :store_id,
        product_option_types_attributes: [
          :id,
          :option_type_id,
          :_destroy
        ]
      )
  end
end
