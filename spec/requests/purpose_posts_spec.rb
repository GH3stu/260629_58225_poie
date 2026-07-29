require 'rails_helper'

RSpec.describe "PurposePosts", type: :request do
  let!(:purpose) { Purpose.create!(name: "移動") }
  let!(:category) { Category.create!(name: "テストカテゴリ") }
  let!(:admin) { Admin.create!(name: "poier", email: "admin@example.com", password: "password") }
  let!(:admin_post) do
    Post.create!(
      title: "管理者投稿タイトル",
      body: "管理者投稿本文",
      admin: admin,
      purpose: purpose,
      category: category
    )
  end

  describe "GET /purposes/:purpose_id/posts" do
    it "非ログイン時は投稿詳細リンクがログイン画面を向く" do
      get purpose_posts_path(purpose)

      expect(response).to have_http_status(:success)

      html = Nokogiri::HTML.parse(response.body)
      row = html.css('tr').find { |tr| tr.text.include?(admin_post.title) }

      expect(row).to be_present

      title_link = row.css('a').find { |a| a.text.strip == admin_post.title }
      detail_link = row.css('a').find { |a| a.text.strip == '詳細' }

      expect(title_link).to be_present
      expect(detail_link).to be_present
      expect(title_link['href']).to eq(login_path)
      expect(detail_link['href']).to eq(login_path)
      expect(response.body).not_to include(admin_post_path(admin_post))
    end
  end
end
