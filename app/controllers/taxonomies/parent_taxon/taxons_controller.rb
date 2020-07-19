module Taxonomies
  module ParentTaxon
    class TaxonsController < StoreController
      before_action :taxonomy
      before_action :taxon

      private

      def taxonomy
        @taxonomy = @store.taxonomies.find(params[:taxonomy_id])
      end

      def taxon
        @taxon = @taxonomy.taxons.find(params[:parent_taxon_id])
      end
    end
  end
end