class OptionTypesController < StoreController
    before_action :load_option_types, only: [:edit, :show, :update, :destroy]

    def index
        @option_types = @store.option_types.all
    end

    def new
        @option_types = @store.option_types.new
        @option_types.option_values.build
    end

    def edit
        @option_types.option_values.build
    end

    def create
        @option_types = @store.option_types.new(option_types_params)
        if @option_types.save
          redirect_to edit_option_type_path(@option_types), notice: 'option type was successfully created.'
        else
          render :new
        end
    end

    def update
        @option_types.update(option_types_params)
        redirect_to edit_option_type_path(@option_types), notice: 'option type was successfully updated.'
    end

    def destroy
        @option_types.destroy
        redirect_to option_types_url
    end

    private

    def load_option_types
      @option_types = @store.option_types.find(params[:id])
    end
    
    def option_types_params
        params.require(:option_type).permit(:name, :presentation,
         :option_values_attributes => [:id, :name, :presentation])
    end
end
