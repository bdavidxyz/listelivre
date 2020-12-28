class SessionsController < Clearance::SessionsController

  protected

  def url_after_destroy
    flash[:notice] = "Vous avez été déconnecté(e)"
    root_path
  end

end

