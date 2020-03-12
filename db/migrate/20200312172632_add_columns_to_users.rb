class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :superadmin_role, :boolean, default: false
     add_column :users, :supervisor_role, :boolean, default: false
     add_column :users, :user_role, :boolean, default: true
     add_column :users, :avatar, :string
     add_column :users, :description, :string
     add_column :users, :is_speaker, :boolean, default:false
  end
end
