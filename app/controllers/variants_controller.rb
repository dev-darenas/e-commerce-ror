class VariantsController < StoreController
    before_action :load_variants, only: [:edit, :show, :update, :destroy]

    def index
        @variants = @store.variants.all
    end

    def new
        @variants = @store.variants.new
    end

    def create
        @variants = @store.variants.new(variant_params)
        if @variants.save
          redirect_to edit_variant_path(@variants), notice: 'variant was successfully created.'
        else
          render :new
        end
    end

    def update
        @variants.update(variant_params)
        redirect_to edit_variant_path(@variants), notice: 'variant was successfully updated.'
    end

    def destroy
        @variants.destroy
        redirect_to variants_url
    end

    private

    def load_variants
      @variants = @store.variants.find(params[:id])
    end
    
    def variant_params
        params.require(:variant).permit(:is_master, :cost_price, :price_sale, :available_on, :discontinue_on, :sku)
    end
end
