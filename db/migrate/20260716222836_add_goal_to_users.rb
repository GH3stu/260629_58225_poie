class AddGoalToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :goal, :integer, default: 0, null: false
  end
end
