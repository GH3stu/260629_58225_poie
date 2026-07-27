require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let(:user) { User.create!(name: "Test", email: "test@example.com", password: "password") }
  let(:post_record) { Post.create!(title: "タイトル", body: "本文", user: user) }

  before do
    post login_path, params: { email: user.email, password: "password" }
  end

  describe "GET /user/posts" do
    it "一覧表示" do
      get user_posts_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /user/posts/:id" do
    it "詳細表示" do
      get user_post_path(post_record)
      expect(response).to have_http_status(:success)
    end
  end
end
