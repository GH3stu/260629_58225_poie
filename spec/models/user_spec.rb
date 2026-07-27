require 'rails_helper'

RSpec.describe User, type: :model do
  it "name, email, password があれば有効" do
    user = User.new(name: "Test", email: "test@example.com", password: "password")
    expect(user).to be_valid
  end

  it "name が無いと無効" do
    user = User.new(email: "test@example.com", password: "password")
    expect(user).not_to be_valid
  end

  it "email が無いと無効" do
    user = User.new(name: "Test", password: "password")
    expect(user).not_to be_valid
  end

  it "email が重複すると無効" do
    User.create!(name: "A", email: "test@example.com", password: "password")
    user = User.new(name: "B", email: "test@example.com", password: "password")
    expect(user).not_to be_valid
  end
end
