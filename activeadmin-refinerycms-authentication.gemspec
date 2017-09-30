# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name          = "activeadmin-refinerycms-authentication"
  s.version       = "0.0.4"
  s.authors       = ["eugen neagoe"]
  s.description   = "A Refinery CMS and activeadmin connector"
  s.summary       = "This will tell Refinery CMS to use ActiveAdmin for authentication."
  s.homepage      = "https://github.com/appmospheres/activeadmin-refinery-authentication"

  s.files         = [
    'Gemfile'.freeze,
    'LICENSE.txt'.freeze,
    'README.md'.freeze,
    'Rakefile'.freeze,
    'activeadmin-refinerycms-authentication.gemspec'.freeze,
    'app/decorators/controllers/action_controller_base_decorator.rb'.freeze,
    'app/decorators/controllers/refinery/admin_controller_decorator.rb'.freeze,
    'app/decorators/controllers/refinery/application_controller_decorator.rb'.freeze,
    'app/decorators/controllers/sessions_controller_decorator.rb'.freeze,
    'app/decorators/models/user_decorator.rb'.freeze,
    'app/models/user_plugin.rb'.freeze,
    'app/overrides/active_admin_link.rb'.freeze,
    'lib/activeadmin-refinerycms-authentication.rb'.freeze,
    'lib/activeadmin_refinery_authentication/authorisation_adapter.rb'.freeze,
    'lib/activeadmin_refinery_authentication/authorisation_manager.rb'.freeze,
    'lib/activeadmin_refinery_authentication/engine.rb'.freeze,
    'lib/generators/activeadmin_refinery_authentication/install/install_generator.rb'.freeze,
    'lib/generators/activeadmin_refinery_authentication/install/templates/_plugins_form.html.erb'.freeze,
    'lib/generators/activeadmin_refinery_authentication/install/templates/activeadmin-refinery-authentication.rb.erb'.freeze,
    'lib/generators/activeadmin_refinery_authentication/install/templates/migrations/create_user_plugins.rb'.freeze
  ]
  s.test_files    = s.files.grep(%r{^spec/})
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'activeadmin'

  s.add_runtime_dependency 'refinerycms-core', '~> 4.0.0'
  s.add_runtime_dependency 'zilch-authorisation', '>= 0.0.1'
  s.add_runtime_dependency 'decorators', '~> 2.0.0'
  s.add_runtime_dependency 'deface', '~> 1.0.0'
end
