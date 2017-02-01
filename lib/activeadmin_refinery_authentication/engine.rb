require 'refinery/engine'
require 'zilch/authorisation'

module ActiveAdminRefineryAuthentication
  class Engine < Rails::Engine

    include Refinery::Engine
    engine_name "activeadmin_refinery_authentication"

    config.autoload_paths += %W( #{config.root}/lib )

    before_inclusion do
      Refinery::Plugin.register do |plugin|
        plugin.name = 'activeadmin_refinery_authentication'
        plugin.pathname = root
        plugin.hide_from_menu = true
        plugin.always_allow_access = true
      end
    end

    config.to_prepare do
      if defined?(WillPaginate)
        ::WillPaginate::ActiveRecord::RelationMethods.module_eval do
          def per_page(num)
            if (n = num.to_i) <= 0
              self
            else
              limit(n).offset(offset_value / limit_value * n)
            end
          end

          def total_pages
            (total_count.to_f / limit_value).ceil
          end

          alias_method :per, :per_page
          alias_method :num_pages, :total_pages
          alias_method :total_count, :total_entries
          alias_method :prev_page, :previous_page
        end
      end
    end

    config.after_initialize do
      Rails.application.reload_routes!

      if Rails.application.config.x.aa_refinery.show_refinery_in_active_admin
        ::ActiveAdmin.register_page 'Refinery CMS' do
          menu label: I18n.t('refinery.plugins.refinery_core.title'),
               url: Refinery::Core.backend_path,
               priority: Rails.application.config.x.aa_refinery.refinery_active_admin_menu_priority
        end
      end
    end
  end
end
