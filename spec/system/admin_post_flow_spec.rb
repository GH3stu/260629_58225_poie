require 'rails_helper'

RSpec.describe "AdminPostFlow", type: :system do
  let(:admin) { Admin.create!(email: "admin@example.com", password: "password") }
  let!(:other_category) { Category.create!(name: "その他カテゴリ") }
  let!(:sub_category) { SubCategory.create!(name: "サブカテゴリ", category: other_category) }

  before do
    driven_by(:rack_test)
    visit admin_login_path
    fill_in "email", with: admin.email
    fill_in "password", with: "password"
    click_button "ログイン"
  end

  it "管理者投稿の作成→詳細→編集→削除" do
    visit new_admin_post_path
    fill_in "post_title", with: "管理者タイトル"
    fill_in "post_body", with: "管理者本文"
    select "その他カテゴリ", from: "post_category_id"
    click_button "投稿"

    expect(page).to have_content("管理者タイトル")

    click_link "編集"
    fill_in "post_title", with: "編集後タイトル"
    click_button "更新"

    expect(page).to have_content("編集後タイトル")

    click_button "削除"
    expect(page).not_to have_content("編集後タイトル")
  end
end
