module Api
  module V1
    module Stores
      class VariantsController < StoresController
        def index
          render json: { variants: [] } 
        end
      end
    end
  end
end
