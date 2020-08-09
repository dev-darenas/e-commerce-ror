module Api
  module V1
    module Stores
      class ProductsController < StoresController
        before_action :load_product, only: [:show]

        def index
          @products = @store.products
          @products = @store.products.first params[:count].to_i unless params[:count].blank?
          render json: ProductSerializer.new(@products).serializable_hash
        end

        def show
          render json: ProductDetailSerializer.new(@product).serializable_hash
        end

        private

        def load_product
          @product = @store.products.find params[:id]
        end
      end
    end
  end
end
