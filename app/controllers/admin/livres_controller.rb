module Admin
  class LivresController < Admin::ApplicationController

    before_action :check_authorization, only: [:show, :edit, :update, :destroy]

    def check_authorization
      if (current_user.role != "superadmin")    
        if Livre.find(params["id"]).proprietaire != _lien_proprio
          raise SecurityError
        end
      end
    end

    def scoped_resource
      if (current_user.role != "superadmin")
        Livre.where(proprietaire: _lien_proprio)
      else
        Livre.all
      end
    end

    def _lien_proprio
      current_user.email
    end

  end
end
