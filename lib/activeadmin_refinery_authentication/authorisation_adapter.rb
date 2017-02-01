require "refinery/core/authorisation_adapter"

module ActiveAdminRefineryAuthentication
  class AuthorisationAdapter < Refinery::Core::AuthorisationAdapter

    def current_user
      @current_user ||= Rails.application.config.x.aa_refinery.admin_user_class.constantize.new
    end

    def current_user=(user)
      @current_user = user
    end

    def allow?(operation, resource)
      case
      when resource == :site_bar
        current_user.has_role?(:refinery)
      when operation == :plugin
        current_user.active_plugins.names.include?(resource)
      when operation == :controller
        current_user.active_plugins.any? do |plugin|
          Regexp.new(plugin.menu_match) === resource
        end
      else
        false
      end
    end
  end
end
