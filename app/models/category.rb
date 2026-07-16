class Category < ApplicationRecord
  has_many :purpose_categories, dependent: :destroy
  has_many :purposes, through: :purpose_categories

  has_many :posts
  has_many :sub_categories, dependent: :destroy

  # ここに追加：カテゴリ表示順の定数（クラス定数）
  ORDER_NAMES = [
    "楽天ポイント",
    "dポイント",
    "Pontaポイント",
    "PayPayポイント",
    "Vポイント",
    "JALマイル",
    "ANAマイル",
    "モッピーポイント",
    "その他ポイント",
    "ポイント運用"
  ]

  # 投稿フォーム・サイドバー用カテゴリ集合（順番固定）
  def self.for_post_select
    categories = Category.where(name: ORDER_NAMES)          # ここに追加：ORDER_NAMESに基づいてカテゴリを取得
    unique_categories = categories.uniq { |c| c.name }
    unique_categories.sort_by { |c| ORDER_NAMES.index(c.name) }
  end
end
