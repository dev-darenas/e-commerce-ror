class ProductsController < StoreController
    before_action :load_products, only: [:edit, :show, :update, :destroy]

    def index
        @products = @store.products.all
    end

    def new
        @products = @store.products.new
    end

    def create
        @products = @store.products.new(products_params)
        if @products.save
          redirect_to edit_product_path(@products), notice: 'product was successfully created.'
        else
          render :new
        end
    end

    def update
        @products.update(products_params)
        redirect_to edit_product_path(@products), notice: 'product was successfully updated.'
    end

    def destroy
        @products.destroy
        redirect_to products_url
    end

    private

    def load_products
      @products = @store.products.find(params[:id])
    end
    
    def products_params
        params.require(:product).permit(:name, :description,
            :variants_attributes => [:sku, :cost_price, :price_sale,
                 :available_on, :discontinue_on])
    end
end
