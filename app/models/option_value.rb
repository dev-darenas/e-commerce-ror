class OptionValue < ApplicationRecord
  belongs_to :option_type, optional: true
end
