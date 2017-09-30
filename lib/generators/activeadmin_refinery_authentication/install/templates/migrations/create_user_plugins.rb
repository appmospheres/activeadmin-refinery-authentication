class CreateUserPlugins < ActiveRecord::Migration[4.2]
  def change
    create_table :active_admin_refinery_user_plugins do |t|
      t.integer :user_id
      t.string  :name
      t.integer :position
    end

    add_index :active_admin_refinery_user_plugins, :name
    add_index :active_admin_refinery_user_plugins, [:user_id, :name], unique: true
  end
end
