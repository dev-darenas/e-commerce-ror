class TaxonsController < StoreController


  private
  def taxon_params
    params.require(:taxon).permit(:name, :taxonomy_id, :store_id, :taxon_id, :permalink)
  end
end
