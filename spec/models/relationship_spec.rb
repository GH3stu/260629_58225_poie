require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:user1) { User.create!(name: "A", email: "a@example.com", password: "password") }
  let(:user2) { User.create!(name: "B", email: "b@example.com", password: "password") }

  it "follower と followed があれば有効" do
    rel = Relationship.new(follower: user1, followed: user2)
    expect(rel).to be_valid
  end

  it "follower が無いと無効" do
    rel = Relationship.new(followed: user2)
    expect(rel).not_to be_valid
  end

  it "followed が無いと無効" do
    rel = Relationship.new(follower: user1)
    expect(rel).not_to be_valid
  end
end
