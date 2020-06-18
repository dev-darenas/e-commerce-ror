class OptionTypesController < ApplicationController
    def index
        @option_types = @store.option_types.all.order("created_at DESC")
    end
    def new
        @option_types = @store.option_types.new
    end
    def show
        @option_types = @store.option_types.find(params[:id])
    end
    def edit
        @option_types = @store.option_types.find(params[:id])
    end
    def create
        @option_types = @store.option_types.new(option_types_params)
        respond_to do |format|
            if @option_types.save
              format.html { redirect_to @option_types, notice: 'option_types was successfully created.' }
              format.json { render :show, status: :created, location: @option_types }
            else
              format.html { render :new }
              format.json { render json: @option_types.errors, status: :unprocessable_entity }
            end
          end
    end
    def update
        respond_to do |format|
          if @option_types.update(option_types_params)
            format.html { redirect_to @option_types, notice: 'Option type was successfully updated.' }
            format.json { render :show, status: :ok, location: @option_types }
          else
            format.html { render :edit }
            format.json { render json: @option_types.errors, status: :unprocessable_entity }
          end
        end
        @option_types = @store.option_types.find(params[:id])
 
        if @option_types.update(option_types_params)
          redirect_to @option_types
        else
          render 'edit'
        end
    end
    def destroy
        @option_types = @store.option_types.find(params[:id])
        @option_types.destroy
 
        redirect_to option_types_url
    end
    def option_types_params
        params.require(:option_types).permit(:name, :presentation)
    end
end
