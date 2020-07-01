class PropertiesController < StoreController
  before_action :load_properties, only: [:edit, :show, :update, :destroy]

  def index
    @properties = @store.properties.all
  end

  def new
    @properties = @store.properties.new
  end

  def create
    @properties = @store.properties.new(properties_params)
    if @properties.save
      redirect_to edit_property_path(@properties), notice: 'property was successfully created.'
    else
      render :new
    end
  end

  def update
    @properties.update(properties_params)
    redirect_to edit_property_path(@properties), notice: 'property was successfully updated.'
  end

  def destroy
    @properties.destroy
    redirect_to properties_url
  end

  private

  def load_properties
    @properties = @store.properties.find(params[:id])
  end
    
  def properties_params
    params.require(:property).permit(:name, :presentation)
  end
end
