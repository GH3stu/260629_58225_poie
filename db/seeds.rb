# Purpose（大分類）7つを登録
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
