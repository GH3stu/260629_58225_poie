class User < ApplicationRecord
  has_secure_password 

  has_many :posts, dependent: :destroy

  validates :name, presence: { message: "を入力してください" }
  validates :email, presence: { message: "を入力してください" },
                    uniqueness: { message: "は既に使用されています" }
  # 新規登録時：必須
  # 編集時：空欄OK（変更したいときだけ入力）
  validates :password, presence: { message: "を入力してください" },
                       length: { minimum: 6, message: "は6文字以上で入力してください" },
                       allow_blank: true
end
