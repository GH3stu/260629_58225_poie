class RemoveGoalFromUsers < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :goal, :integer
  end
end
