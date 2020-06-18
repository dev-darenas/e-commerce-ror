class OptionTypesController < ApplicationController
    def index
        @option_type = OptionType.all.order("created_at DESC")
    end
    def new
        @option_type = OptionType.new
    end
    def show
        @option_type = OptionType.find(params[:id])
    end
    def edit
        @option_type = OptionType.find(params[:id])
    end
    def create
        @option_type = OptionType.new(option_type_params)
        respond_to do |format|
            if @option_type.save
              format.html { redirect_to @option_type, notice: 'Option_type was successfully created.' }
              format.json { render :show, status: :created, location: @option_type }
            else
              format.html { render :new }
              format.json { render json: @option_type.errors, status: :unprocessable_entity }
            end
          end
    end
    def update
        respond_to do |format|
          if @option_type.update(option_type_params)
            format.html { redirect_to @option_type, notice: 'Option type was successfully updated.' }
            format.json { render :show, status: :ok, location: @option_type }
          else
            format.html { render :edit }
            format.json { render json: @option_type.errors, status: :unprocessable_entity }
          end
        end
        @option_type = OptionType.find(params[:id])
 
        if @option_type.update(option_type_params)
          redirect_to @option_type
        else
          render 'edit'
        end
    end
    def destroy
        @option_type = OptionType.find(params[:id])
        @option_type.destroy
 
        redirect_to option_types_url
    end
    def option_type_params
        params.require(:option_type).permit(:name, :presentation)
    end
end
