unless Rails.application.config.x.aa_refinery.empty?
  Rails.application.config.x.aa_refinery.admin_user_class.constantize.class_eval do
    has_many :plugins, -> { order('position ASC') },
      class_name: "::UserPlugin", foreign_key: 'user_id', dependent: :destroy

    # Should be overridden in authentication solutions.
    def has_role?(role)
      case
      when role == :superuser
        send Rails.application.config.x.aa_refinery.refinery_role_method
      when role == :refinery
        send Rails.application.config.x.aa_refinery.refinery_role_method
      else
        false
      end
    end

    def self.available_plugins
      Refinery::Plugins.registered.in_menu.map { |a|
        { :name => a.name, :title => a.title }
      }.sort_by { |a| a[:title] }
    end

    def plugins=(plugin_names)
      filtered_names = filter_existing_plugins_for(string_plugin_names(plugin_names))
      build_or_create_plugins_for(filtered_names)
    end

    def active_plugins
      @active_plugins ||= Refinery::Plugins.new(
        Refinery::Plugins.registered.select do |plugin|
          authorised_plugins.include?(plugin.name)
        end
      )
    end

    def has_plugin?(name)
      active_plugins.names.include?(name)
    end

    def authorised_plugins
      plugins.collect(&:name) | ::Refinery::Plugins.always_allowed.names
    end
    alias_method :authorized_plugins, :authorised_plugins

    def landing_url
      active_plugins.in_menu.first_url_in_menu
    end

    private

    def string_plugin_names(plugin_names)
      plugin_names.select{ |plugin_name| plugin_name.is_a?(String) }
    end

    def build_or_create_plugins_for(plugin_names)
      if persisted?
        plugin_names.each { |plugin_name| plugins.create name: plugin_name, position: plugin_position}
      else
        plugin_names.each { |plugin_name| plugins.build name: plugin_name, position: plugin_position}
      end
    end

    def plugin_position
      plugins.select(:position).map{ |p| p.position.to_i}.max.to_i + 1
    end

    def filter_existing_plugins_for(plugin_names)
      assigned_plugins = plugins.load
      assigned_plugins.each do |assigned_plugin|
        if plugin_names.include?(assigned_plugin.name)
          plugin_names.delete(assigned_plugin.name)
        else
          assigned_plugin.destroy
        end
      end
      plugin_names
    end
  end
end
