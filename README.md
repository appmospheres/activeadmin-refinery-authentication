# Add to Gemfile
gem 'refinerycms', '~> 3.0'
gem 'activeadmin', '~> 1.0.0pre'
gem 'devise'

gem 'activeadmin-refinerycms-authentication'
gem 'deface', '~> 1.0.0'

Run ActiveAdmin generator, then the refinery:cms generator.

# Add to routes
Make sure refinery is mounted in a subpath, not directly at root.

mount Refinery::Core::Engine, at: Refinery::Core.mounted_path

# Configure refinery authentication
`rails g activeadmin_refinery_authentication:install MODELNAME` where MODELNAME is the name of the ActiveAdmin user
Add `plugins: []` to `permit_params` in the ActiveAdmin user model.
Add the plugins partial to the edit form of the ActiveAdmin user model:

    panel t('panels.user_plugins') do
      render 'admin/users/plugins_form', f: f
    end
