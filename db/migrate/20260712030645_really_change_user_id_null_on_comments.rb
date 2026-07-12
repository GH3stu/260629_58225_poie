class ReallyChangeUserIdNullOnComments < ActiveRecord::Migration[8.0]
  def change
    change_column_null :comments, :user_id, true   # ここが絶対必要
  end
end
