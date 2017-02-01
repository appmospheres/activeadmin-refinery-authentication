class UserPlugin < Refinery::Core::BaseModel
  self.table_name = 'active_admin_refinery_user_plugins'
  belongs_to Rails.application.config.x.aa_refinery.admin_user_class.singularize.underscore.to_sym,
             foreign_key: 'user_id'
end
