require 'rails_helper'

RSpec.describe Admin, type: :model do
  it "email と password があれば有効" do
    admin = Admin.new(email: "admin@example.com", password: "password")
    expect(admin).to be_valid
  end

  it "password が無いと無効" do
    admin = Admin.new(email: "admin@example.com")
    expect(admin).not_to be_valid
  end
end
