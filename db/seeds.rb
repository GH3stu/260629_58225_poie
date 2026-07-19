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
