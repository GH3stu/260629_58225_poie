class AddPurposeIdToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :purpose_id, :integer
  end
end
