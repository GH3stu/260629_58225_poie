class AddSubCategoryIdToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :sub_category_id, :integer
    add_index  :posts, :sub_category_id
  end
end
