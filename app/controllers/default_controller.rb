class DefaultController < ApplicationController

  def index
    
  end
  
  def post_superadmin
    res = User.create!(email: "db@sel.com", password: extract_param("super_mdp"), role: "superadmin")
    render json: {
      status: "ok"
    }
  end
  
end
