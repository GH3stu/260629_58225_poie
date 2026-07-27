require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create!(name: "Test", email: "test@example.com", password: "password") }
  let(:post_record) { Post.create!(title: "タイトル", body: "本文", user: user) }

  it "post があれば有効" do
    comment = Comment.new(body: "コメント", post: post_record, user: user)
    expect(comment).to be_valid
  end

  it "post が無いと無効" do
    comment = Comment.new(body: "コメント")
    expect(comment).not_to be_valid
  end
end
