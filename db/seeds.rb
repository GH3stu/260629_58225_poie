# -----------------------------
# Purpose（目的）初期データ
# -----------------------------
purposes = [
  "買い物で貯める",
  "移動で貯める",
  "スマホ・通信で貯める",
  "カード・金融で貯める",
  "デジタルで貯める",
  "生活で貯める",
  "その他で貯める"
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
