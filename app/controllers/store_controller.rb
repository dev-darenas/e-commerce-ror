class StoreController < ApplicationController
  layout "store"
  before_action :authenticate_user!
  before_action :load_store
  
  def update
    @store.update(store_params)
    redirect_to edit_store_path(@store)
  end

  private

  def store_params
    params
      .require(:store)
      .permit(:name, :email, :instagram, :whatsapp)
  end
 
  def load_store
    @store = current_user.store
  end
end
