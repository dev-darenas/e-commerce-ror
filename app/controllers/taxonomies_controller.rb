class TaxonomiesController < StoreController
  before_action :load_taxonomy, only: [:edit, :show, :update, :destroy]

  def index
    @taxonomies = @store.taxonomies
  end

  def new
    @taxonomy = @store.taxonomies.new
  end

  def create
    @taxonomy = @store.taxonomies.new(taxonomy_params)
    if @taxonomy.save
      redirect_to edit_taxonomy_path(@taxonomy), notice: 'Taxonomy ha sido actualizado.'
    else
      render :new
    end
  end

  def edit
    @taxonomy.taxons.new(parent_id: @taxonomy.root.id, store: @store)
  end

  def update
    @taxonomy.update(taxonomy_params)
    redirect_to edit_taxonomy_path(@taxonomy), notice: 'Taxonomy ha sido actualizado.'
  end

  private

  def load_taxonomy
    @taxonomy = @store.taxonomies.find(params[:id])
  end

  def taxonomy_params
    params.require(:taxonomy).permit(:name,
      taxons_attributes: [:id, :name, :parent_id, :store_id, :_destroy]
    )
  end
end
