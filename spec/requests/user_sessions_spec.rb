require 'rails_helper'

RSpec.describe "UserSessions", type: :request do
  let(:user) { User.create!(name: "Test", email: "test@example.com", password: "password") }

  describe "POST /login" do
    it "ログイン成功" do
      post login_path, params: { email: user.email, password: "password" }
      expect(session[:user_id]).to eq(user.id)
    end

    it "ログイン失敗" do
      post login_path, params: { email: user.email, password: "wrong" }
      expect(session[:user_id]).to be_nil
    end
  end

  describe "DELETE /logout" do
    it "ログアウト成功" do
      post login_path, params: { email: user.email, password: "password" }
      delete logout_path
      expect(session[:user_id]).to be_nil
    end
  end
end
