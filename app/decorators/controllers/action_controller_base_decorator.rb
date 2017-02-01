require "activeadmin_refinery_authentication/authorisation_manager"

module ActiveAdminAuthenticationActionControllerBaseDecoration
  def self.prepended(base)
    base.prepend_before_action :detect_activeadmin_sign_on!
  end

  protected
  def refinery_users_exist?
    raise not_yet_implemented
  end

  private
  def refinery_authorisation_manager
    @refinery_authorisation_manager ||= ActiveAdminRefineryAuthentication::AuthorisationManager.new
  end

  def detect_activeadmin_sign_on!
    current_user = send Rails.application.config.x.aa_refinery.current_user_method
    if current_user
      refinery_authorisation_manager.set_user!(current_user)
    end
  end
end

ActionController::Base.send :prepend, ActiveAdminAuthenticationActionControllerBaseDecoration
