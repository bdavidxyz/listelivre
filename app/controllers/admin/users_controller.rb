module Admin
  class UsersController < Admin::ApplicationController
    
    def destroy
      if requested_resource.destroy
        Livre.where(proprietaire: initiales).destroy_all
        flash[:notice] = translate_with_resource("destroy.success")
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
