module Admin
  class UsersController < Admin::ApplicationController

    before_action :must_be_superadmin

    def must_be_superadmin
      if current_user.try(:role) != 'superadmin'
        raise SecurityError
      end
    end

    def destroy
      if requested_resource.destroy
        Livre.where(proprietaire: initiales).destroy_all
        flash[:notice] = "Votre compte a été entièrement supprimé, ainsi que vos livres"
      else
        flash[:error] = requested_resource.errors.full_messages.join("<br/>")
      end
      redirect_to action: :index
    end

    def initiales
      current_user.email.split("@")[0]
    end

  end
end
