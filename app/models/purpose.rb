class Purpose < ApplicationRecord
  has_many :sub_categories, dependent: :destroy
end
