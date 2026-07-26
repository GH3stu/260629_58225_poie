class AddGoalPointToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :goal_point, :integer
  end
end
