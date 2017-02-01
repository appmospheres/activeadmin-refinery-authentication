module ActiveAdminRefineryAuthenticationAdminControllerDecorator
  protected
  def authenticate_refinery_user!
    begin
      super
    rescue Zilch::Authorisation::NotAuthorisedException
      session["user_return_to"] = request.path
      current_user = send(Rails.application.config.x.aa_refinery.current_user_method)
      if current_user.present?
        # avoid redirect loop
        redirect_to main_app.admin_root_path and return
      else
        redirect_to main_app.send(Rails.application.config.x.aa_refinery.admin_login_path) and return
      end
    end
  end

  private
  def authorisation_manager
    refinery_authorisation_manager
  end
end

Refinery::AdminController.send :prepend, ActiveAdminRefineryAuthenticationAdminControllerDecorator
