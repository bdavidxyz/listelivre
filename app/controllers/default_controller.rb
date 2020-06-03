class DefaultController < ApplicationController

  def index
    
  end
  
  def post_superadmin
    render json: {
      status: "ok"
    }
  end
  
end
