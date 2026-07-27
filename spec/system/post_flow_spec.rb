require 'rails_helper'

RSpec.describe "PostFlow", type: :system do
  let(:user) { User.create!(name: "Test", email: "test@example.com", password: "password") }

  before do
    driven_by(:rack_test)
    visit login_path
    fill_in "email", with: user.email
    fill_in "password", with: "password"
    click_button "ログイン"
  end

  it "投稿の作成→詳細→編集→削除" do
    visit new_user_post_path
    fill_in "post_title", with: "タイトル"
    fill_in "post_body", with: "本文"
    click_button "投稿"

    expect(page).to have_content("タイトル")

    click_link "編集"
    fill_in "post_title", with: "編集後タイトル"
    click_button "更新"

    expect(page).to have_content("編集後タイトル")

    click_button "削除"
    expect(page).not_to have_content("編集後タイトル")
  end
end
