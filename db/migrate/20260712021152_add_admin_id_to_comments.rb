class AddAdminIdToComments < ActiveRecord::Migration[8.0]
  def change
    add_column :comments, :admin_id, :integer
  end
end
