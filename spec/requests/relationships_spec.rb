require 'rails_helper'

RSpec.describe "Relationships", type: :request do
  let(:user1) { User.create!(name: "A", email: "a@example.com", password: "password") }
  let(:user2) { User.create!(name: "B", email: "b@example.com", password: "password") }

  before do
    post login_path, params: { email: user1.email, password: "password" }
  end

  describe "POST /user/relationships" do
    it "フォローできる" do
      expect {
        post user_relationships_path, params: { followed_id: user2.id }
      }.to change(Relationship, :count).by(1)
    end
  end

  describe "DELETE /user/relationships/:id" do
    it "フォロー解除できる" do
      rel = Relationship.create!(follower: user1, followed: user2)
      expect {
        delete user_relationship_path(rel)
      }.to change(Relationship, :count).by(-1)
    end
  end
end
