class PropertiesController < ApplicationController
  before_action :load_properties, only: [:edit, :show, :update, :destroy]

    def index
        @properties = Property.all
    end

    def new
        @properties = Property.new
    end

    def create
        @properties = Property.new(properties_params)
        if @properties.save
          redirect_to @properties, notice: 'properties was successfully created.'
        else
          render :new
        end
    end

    def update
        @properties.update(properties_params)
        redirect_to @properties
    end

    def destroy
        @properties.destroy
        redirect_to properties_url
    end

    def load_properties
      @properties = Property.find(params[:id])
    end
    
    def properties_params
        params.require(:property).permit(:name, :presentation)
    end
end
