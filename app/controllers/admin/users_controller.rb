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
        p '- - - - - - - - - - - - - - all_livres- - - - - - - - - - - - - - - -' 
        ap all_livres
        p ''
        all_livres.destroy_all
        # destroyable_user_id = current_user.id
        # p '- - - - - - - - - - - - - - destroyable_user_id- - - - - - - - - - - - - - - -' 
        # ap destroyable_user_id
        # p ''  
        sign_out
        # User.find_by(id: destroyable_user_id).destroy
        flash[:notice] = "Votre compte a été entièrement supprimé, ainsi que vos livres"
      else
        flash[:error] = requested_resource.errors.full_messages.join("<br/>")
      end
      redirect_to action: :index
    end

  end
end
