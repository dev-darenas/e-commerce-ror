module Api
  module V1
    module Stores
      class ProductsController < StoresController
        def index
          render json: ProductSerializer.new(@store.products).serializable_hash
        end
      end
    end
  end
end
