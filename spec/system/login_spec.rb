require 'rails_helper'

RSpec.describe "Login", type: :system do
  let(:user) { User.create!(name: "Test", email: "test@example.com", password: "password") }

  before { driven_by(:rack_test) }

  it "ログイン→ログアウト" do
    visit login_path
    fill_in "email", with: user.email
    fill_in "password", with: "password"
    click_button "ログイン"

    expect(page).to have_content("ようこそ")

    click_link "ログアウト"
    expect(page).to have_current_path(root_path)
  end
end
