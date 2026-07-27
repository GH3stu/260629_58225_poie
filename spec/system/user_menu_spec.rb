require 'rails_helper'

RSpec.describe "UserMenu", type: :system do
  let(:user) { User.create!(name: "Test", email: "test@example.com", password: "password") }

  before do
    driven_by(:rack_test)
    visit login_path
    fill_in "email", with: user.email
    fill_in "password", with: "password"
    click_button "ログイン"
  end

  it "マイページ→プロフィール→ログアウト" do
    click_link "マイページ"
    expect(page).to have_content("さんのお部屋")

    click_link "プロフィール"
    expect(page).to have_content("プロフィール編集")

    click_link "ログアウト"
    expect(page).to have_current_path(root_path)
  end
end
