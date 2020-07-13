class TaxonomiesController < StoreController

  private

    def taxonomy_params
      params.require(:taxonomy).permit(:name, :store_id)
    end

end
