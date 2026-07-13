class Post < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :admin, optional: true
  belongs_to :category, optional: true

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: { message: "を入力してください" }
  validates :body,  presence: { message: "を入力してください" }
end
