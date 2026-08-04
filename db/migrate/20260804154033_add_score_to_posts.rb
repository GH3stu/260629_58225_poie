class AddScoreToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :score, :float
  end
end
