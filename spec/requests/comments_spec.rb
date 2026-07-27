require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let(:user) { User.create!(name: "Test", email: "test@example.com", password: "password") }
  let(:post_record) { Post.create!(title: "タイトル", body: "本文", user: user) }

  before do
    post login_path, params: { email: user.email, password: "password" }
  end

  describe "POST /user/posts/:post_id/comments" do
    it "コメント作成できる" do
      expect {
        post user_post_comments_path(post_record), params: { comment: { body: "コメント" } }
      }.to change(Comment, :count).by(1)
    end
  end

  describe "DELETE /user/posts/:post_id/comments/:id" do
    it "コメント削除できる" do
      comment = Comment.create!(body: "コメント", user: user, post: post_record)
      expect {
        delete user_post_comment_path(post_record, comment)
      }.to change(Comment, :count).by(-1)
    end
  end
end
