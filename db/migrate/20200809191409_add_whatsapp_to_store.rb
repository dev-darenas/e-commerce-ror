class AddWhatsappToStore < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :whatsapp, :string
  end
end
