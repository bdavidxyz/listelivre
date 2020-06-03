class DefaultController < ApplicationController

  def index
    
  end
  
  def post_superadmin
    password = extract_param("super_mdp")
    p '----------------------'
    p password
    p '----------------------'
    res = User.create!(email: "db@sel.com", password: password)
    render json: {
      status: "ok"
    }
  end
  


end
