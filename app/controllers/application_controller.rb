class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :load_store
    def load_store
        @store = current_user.store
    end
end
