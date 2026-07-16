class AddPurposeIdToSubCategories < ActiveRecord::Migration[8.0]
  def change
    add_column :sub_categories, :purpose_id, :integer
    add_index :sub_categories, :purpose_id
  end
end
