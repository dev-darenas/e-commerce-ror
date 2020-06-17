class OptionTypesController < ApplicationController
    def index
        @option_type = OptionType.all.order("created_at DESC")
      end
    def new
        @option_type = OptionType.new
    end
    def show
    end
    def edit
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
    end
    def destroy
        @option_type.destroy
        respond_to do |format|
          format.html { redirect_to option_types_url, notice: 'Option type was successfully destroyed.' }
          format.json { head :no_content }
        end
    end
    def option_type_params
        params.require(:option_type).permit(:name, :presentation)
    end
end
