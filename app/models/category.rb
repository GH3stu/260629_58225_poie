class Category < ApplicationRecord
  has_many :posts
  has_many :sub_categories, dependent: :destroy
  belongs_to :purpose

  # 投稿フォーム・サイドバー用カテゴリ集合（順番固定）
  def self.for_post_select
    order_names = [
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

  categories = Category.where(name: order_names)
  unique_categories = categories.uniq { |c| c.name }
  unique_categories.sort_by { |c| order_names.index(c.name) }
  end
end
