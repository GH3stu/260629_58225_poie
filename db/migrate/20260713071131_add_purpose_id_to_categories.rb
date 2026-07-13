class AddPurposeIdToCategories < ActiveRecord::Migration[8.0]
  def change
    add_column :categories, :purpose_id, :integer
  end
end
