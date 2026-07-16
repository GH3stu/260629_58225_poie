class Purpose < ApplicationRecord
  has_many :purpose_categories, dependent: :destroy
  has_many :categories, through: :purpose_categories
end
