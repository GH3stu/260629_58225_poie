class CreatePurposeCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :purpose_categories do |t|
      t.references :purpose, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
