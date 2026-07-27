require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create!(name: "Test", email: "test@example.com", password: "password") }

  it "title と body があれば有効" do
    post = Post.new(title: "タイトル", body: "本文", user: user)
    expect(post).to be_valid
  end

  it "title が無いと無効" do
    post = Post.new(body: "本文", user: user)
    expect(post).not_to be_valid
  end

  it "body が無いと無効" do
    post = Post.new(title: "タイトル", user: user)
    expect(post).not_to be_valid
  end

  it "author_name が user 名を返す" do
    post = Post.create!(title: "タイトル", body: "本文", user: user)
    expect(post.author_name).to eq("Test")
  end

  it "admin 投稿なら poier を返す" do
    admin = Admin.create!(email: "admin@example.com", password: "password")
    post = Post.create!(title: "タイトル", body: "本文", admin: admin)
    expect(post.author_name).to eq("poier")
  end
end
