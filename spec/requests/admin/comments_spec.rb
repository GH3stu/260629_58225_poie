require 'rails_helper'

RSpec.describe "Admin::Comments", type: :request do
  let(:admin) { Admin.create!(email: "admin@example.com", password: "password") }
  let(:user)  { User.create!(name: "Test", email: "test@example.com", password: "password") }
  let!(:category) { Category.create!(name: "テストカテゴリ") }
  let(:post_record) { Post.create!(title: "タイトル", body: "本文", user: user, category: category) }
  let(:comment) { Comment.create!(body: "コメント", user: user, post: post_record) }

  before do
    post admin_login_path, params: { email: admin.email, password: "password" }
  end

  describe "GET /admin/comments" do
    it "一覧表示" do
      get admin_comments_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /admin/comments/:id" do
    it "詳細表示" do
      get admin_comment_path(comment)
      expect(response).to have_http_status(:success)
    end
  end
end
