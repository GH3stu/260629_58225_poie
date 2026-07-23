# -----------------------------
# Purpose（目的）初期データ
# -----------------------------
purposes = [
  "買い物",
  "移動",
  "スマホ・通信",
  "カード・金融",
  "デジタル",
  "生活",
  "その他"
]

purposes.each do |name|
  Purpose.find_or_create_by(name: name)
end

# -----------------------------
# Category（固定10カテゴリ）
# -----------------------------
categories = [
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

categories.each do |name|
  Category.find_or_create_by(name: name)
end

# デフォルトタグ一覧
default_tags = [
  "#楽天スーパーSALE",
  "#ｄポイント増量",
  "#PayPayジャンボ",
  "#ANAマイル祭り",
  "#JALタイムセール",
  "#初回登録",
  "#乗り換え",
  "#紹介",
  "#エントリー必須",
  "#期間限定",
  "#楽天モバイル",
  "#ahamo",
  "#Amazon",
  "#Yahooショッピング",
  "#ローソン連携",
  "#高還元",
  "#初心者向け",
  "#裏技",
  "#併用可能",
  "#ポイント二重取り",
  "#即時付与",
  "#高難度",
  "#低リスク",
  "#要事前準備",
  "#店舗限定",
  "#オンライン限定",
  "#期間長め",
  "#上級者向け",
  "#複数サービス連携",
  "#ポイント三重取り"
]

# 既存タグがあっても重複作成しないようにする
default_tags.each do |tag_name|
  Tag.find_or_create_by!(name: tag_name)
end

puts "初期タグ30件を登録しました"

# -----------------------------
# SubCategory（目的 × カテゴリ）
# -----------------------------
Purpose.all.each do |purpose|
  Category.all.each do |category|
    SubCategory.find_or_create_by(
      purpose_id: purpose.id,
      category_id: category.id,
      name: "#{purpose.name} × #{category.name}"
    )
  end
end
