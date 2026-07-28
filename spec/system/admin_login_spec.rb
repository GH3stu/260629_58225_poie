require 'rails_helper'

RSpec.describe "AdminLogin", type: :system do
  let(:admin) { Admin.create!(email: "admin@example.com", password: "password") }

  before { driven_by(:rack_test) }

  it "ログイン→ログアウト" do
    visit admin_login_path
    fill_in "email", with: admin.email
    fill_in "password", with: "password"
    click_button "ログイン"

    expect(page).to have_content("管理者")

    click_link "ログアウト"
    expect(page).to have_current_path(admin_login_path)
  end
end
