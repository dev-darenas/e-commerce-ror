class OptionTypesController < ApplicationController
    before_action :load_option_types, only: [:edit, :show, :update, :destroy]

    def index
        @option_types = @store.option_types.all
    end

    def new
        @option_types = @store.option_types.new
    end

    def create
        @option_types = @store.option_types.new(option_types_params)
        if @option_types.save
          redirect_to @option_types, notice: 'option_types was successfully created.'
        else
          render :new
        end
    end

    def update
        @option_types.update(option_types_params)
        redirect_to @option_types
    end

    def destroy
        @option_types.destroy
        redirect_to option_types_url
    end

    def load_option_types
      @option_types = @store.option_types.find(params[:id])
    end
    
    def option_types_params
        params.require(:option_type).permit(:name, :presentation)
    end
end
