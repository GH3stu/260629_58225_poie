class Category < ApplicationRecord
  has_many :posts
  has_many :sub_categories, dependent: :destroy
  
  belongs_to :purpose
end
