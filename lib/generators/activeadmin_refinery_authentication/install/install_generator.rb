require 'rails/generators/active_record'

module ActiveadminRefineryAuthentication
  module Generators
    class InstallGenerator < ActiveRecord::Generators::Base
      desc "Installs Refinery Authentication via Active Admin and generates the necessary migrations"
      argument :name, type: :string, default: 'AdminUser'

      source_root File.expand_path("../templates", __FILE__)

      def copy_initializer
        @user_class = name
        @formatted_user_name = name.underscore.gsub('/', '_')
        template 'activeadmin-refinery-authentication.rb.erb', 'config/initializers/activeadmin_refinery_authentication.rb'
      end

      def copy_views
        @user_class = name
        @formatted_user_name = name.underscore.gsub('/', '_')
        template '_plugins_form.html.erb', 'app/views/admin/users/_plugins_form.html.erb'
      end

      def create_migrations
        migration_template 'migrations/create_user_plugins.rb', 'db/migrate/create_user_plugins.rb'
      end
    end
  end
end
