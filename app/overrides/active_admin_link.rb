Deface::Override.new(
  virtual_path: 'refinery/admin/_menu',
  original: '71468c0788f57fd03c9c6c2ebe3c6c026be5aeb5',
  name: 'active_admin_link',
  insert_top: '#menu',
  text: "<%= link_to I18n.t('active_admin.title', default: 'ActiveAdmin'), main_app.admin_root_path %>"
)
