class StoreController < ApplicationController
  before_action :authenticate_user!
  before_action :load_store
  
  private

  def load_store
    @store = current_user.store
  end
end
