require "refinery/core/authorisation_manager"
require "activeadmin_refinery_authentication/authorisation_adapter"

module ActiveAdminRefineryAuthentication
  class AuthorisationManager < Refinery::Core::AuthorisationManager

    def authenticate!
      unless adapter.current_user.send(config.refinery_role_method)
        raise Zilch::Authorisation::NotAuthorisedException
      end

      adapter.current_user
    end

    def default_adapter
      @default_adapter ||= ActiveAdminRefineryAuthentication::AuthorisationAdapter.new
    end

    def set_user!(user)
      adapter.current_user = user
    end

    private

    def config
      Rails.application.config.x.aa_refinery
    end
  end
end
