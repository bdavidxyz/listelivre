module Admin
  class LivresController < Admin::ApplicationController

    before_action :check_authorization, only: [:show, :edit, :update, :destroy]

    def check_authorization
      if (current_user.role != "superadmin")    
        if Livre.find(params["id"]).proprietaire != initiales
          raise SecurityError
        end
      end
    end

    def scoped_resource
      if (current_user.role != "superadmin")
        Livre.where(proprietaire: initiales)
      else
        Livre.all
      end
    end

    def initiales
      current_user.email.split("@")[0]
    end

  end
end
