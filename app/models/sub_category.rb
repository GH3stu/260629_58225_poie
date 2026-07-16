class SubCategory < ApplicationRecord
  belongs_to :category
  belongs_to :purpose, optional: true

  validates :name, presence: true
end
