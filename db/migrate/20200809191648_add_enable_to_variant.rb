class AddEnableToVariant < ActiveRecord::Migration[6.0]
  def change
    add_column :variants, :enable, :boolean, default: true
  end
end
