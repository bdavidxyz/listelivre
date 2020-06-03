class ApplicationController < ActionController::Base
  include Clearance::Controller

  def extract_param(pname)
    params.extract!(pname).permit(pname).to_h[pname]
  end

end
