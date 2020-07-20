module Products
  class BaseController < StoreController
    before_action :load_product

    private

    def load_product
      @product = @store.products.find(params[:product_id])
    end
  end
end
