module Admin
  class ApplicationController < Administrate::ApplicationController
    include Clearance::Controller
    
    before_action :authenticate_admin

    def authenticate_admin
      unless current_user
        redirect_to sign_in_path
      end
    end

    def extract_param(pname)
      params.extract!(pname).permit(pname).to_h[pname]
    end

  end
end
