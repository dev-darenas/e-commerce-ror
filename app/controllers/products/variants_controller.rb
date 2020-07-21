module Products
  class VariantsController < BaseController
    before_action :load_variant, only: [:edit, :update]

    def index
      @variants = @product.variants
    end

    def new
      @variant = @product.variants.new
    end

    def create
      @variant = @product.variants.new(variant_params)
      if @variant.save
        redirect_to edit_product_variant_path(@product, @variant)
      else
        render :new
      end
    end

    def update
      @variant.update(variant_params)
      redirect_to edit_product_variant_path(@product, @variant)
    end

    private

    def variant_params
      params
        .require(:variant)
        .permit(
          :sku,
          :cost_price,
          :store_id,
          option_value_ids: []
        )
    end

    def load_variant
      @variant = @product.variants.find params[:id]
    end
  end
end
