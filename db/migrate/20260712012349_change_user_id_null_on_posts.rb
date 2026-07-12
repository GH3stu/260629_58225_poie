class ChangeUserIdNullOnPosts < ActiveRecord::Migration[8.0]
  def change
    change_column_null :posts, :user_id, true   # ここに追加
  end
end
