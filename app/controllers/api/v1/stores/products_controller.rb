module Api
  module V1
    module Stores
      class ProductsController < StoresController
        def index
          render json: { products: @store.products }
        end
      end
    end
  end
end
