class OptionValuesController < InheritedResources::Base

  private

    def option_value_params
      params.require(:option_value).permit(:name, :presentation, :option_type_id)
    end

end
