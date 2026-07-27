require 'rails_helper'

RSpec.describe "Admin::Posts", type: :request do
  let(:admin) { Admin.create!(email: "admin@example.com", password: "password") }
  let(:post_record) { Post.create!(title: "タイトル", body: "本文", admin: admin) }

  before do
    post admin_login_path, params: { email: admin.email, password: "password" }
  end

  describe "GET /admin/posts" do
    it "一覧表示" do
      get admin_posts_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /admin/posts/:id" do
    it "詳細表示" do
      get admin_post_path(post_record)
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE /admin/posts/:id" do
    it "削除できる" do
      post_record
      expect {
        delete admin_post_path(post_record)
      }.to change(Post, :count).by(-1)
    end
  end
end
