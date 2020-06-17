module Api
  module V1
    class StoresController < ApplicationController
      before_action :load_store

      private

      def load_store
        @store = Store.find(store_id)
      end

      def store_id
        params.require(:store_id)
      end
    end
  end
end
