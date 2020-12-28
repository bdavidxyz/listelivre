module Admin
  class UsersController < Admin::ApplicationController

    before_action :must_be_superadmin, except: [:destroy]

    def must_be_superadmin
      if current_user.try(:role) != 'superadmin'
        raise SecurityError
      end
    end

    def destroy
      if requested_resource.destroy
        all_livres = Livre.where(proprietaire: current_user.email)
        all_livres.destroy_all
        sign_out
        flash[:notice] = "Votre compte a été entièrement supprimé, ainsi que vos livres"
      else
        flash[:error] = requested_resource.errors.full_messages.join("<br/>")
      end
      redirect_to action: :index
    end

  end
end
