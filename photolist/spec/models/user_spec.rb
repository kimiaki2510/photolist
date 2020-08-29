require 'rails_helper'

#新規登録テスト
RSpec.describe User, type: :model do
  it "is valid with name email" do
    user = User.new(
      name: "ああああああああああ",
      email: "taniguchi@techacademy.com",
      password: "taniguchi",
      password_digest: "taniguchi",
    )
    expect(user).to be_valid
  end
end
