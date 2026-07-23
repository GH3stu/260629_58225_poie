class User < ApplicationRecord
  has_secure_password 

  has_many :posts, dependent: :destroy        # ここに追加
  has_many :comments, dependent: :destroy     # ここに追加
  has_many :likes, dependent: :destroy        # ここに追加

  has_many :active_relationships, class_name: "Relationship",
           foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
           foreign_key: "followed_id", dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post

  validates :name, presence: { message: "を入力してください" }
  validates :email, presence: { message: "を入力してください" },
                    uniqueness: { message: "は既に使用されています" }

  validates :password, presence: { message: "を入力してください" },
                       length: { minimum: 6, message: "は6文字以上で入力してください" },
                       unless: -> { persisted? && password.blank? }
end
