class RemovePurposeIdFromCategories < ActiveRecord::Migration[8.0]
  def change
    remove_column :categories, :purpose_id, :integer
  end
end

