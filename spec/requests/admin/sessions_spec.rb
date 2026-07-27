require 'rails_helper'

RSpec.describe "Admin::Sessions", type: :request do
  let(:admin) { Admin.create!(email: "admin@example.com", password: "password") }

  describe "POST /admin/login" do
    it "ログイン成功" do
      post admin_login_path, params: { email: admin.email, password: "password" }
      expect(session[:admin_id]).to eq(admin.id)
    end

    it "ログイン失敗" do
      post admin_login_path, params: { email: admin.email, password: "wrong" }
      expect(session[:admin_id]).to be_nil
    end
  end

  describe "DELETE /admin/logout" do
    it "ログアウト成功" do
      post admin_login_path, params: { email: admin.email, password: "password" }
      delete admin_logout_path
      expect(session[:admin_id]).to be_nil
    end
  end
end
