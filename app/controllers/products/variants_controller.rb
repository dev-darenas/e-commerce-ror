module Products
  class VariantsController < BaseController
    def index
      @variants = @product.variants
    end

    def new
      @variant = @product.variants.new
    end

    def create
      @variant = @product.variants.new(variant_params)
      render :new
    end

    private

    def variant_params
      params
        .require(:product)
        .permit(
          :sku,
          :cost_price,
          :store_id
        )
    end
  end
end
