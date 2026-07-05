class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy    # ここに追加
  has_many :likes, dependent: :destroy       # ここに追加

  validates :title, presence: { message: "を入力してください" }
  validates :body,  presence: { message: "を入力してください" }
end