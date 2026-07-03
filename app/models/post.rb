class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: { message: "を入力してください" }
  validates :body,  presence: { message: "を入力してください" }
end

