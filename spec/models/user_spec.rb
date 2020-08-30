require 'rails_helper'

#新規登録テスト
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  it "ユーザー作成が有効であるか(プロフィール写真なし)" do
    user = @user
    user.valid?
    expect(user).to be_valid
  end
  #メールアドレスの小文字確認
  it "Test@example.comが小文字のtest@example.comになっているか" do
    user = FactoryBot.create(:user)
    expect(user.email).to eq 'test@example.com'
  end
  #パスワードの再確認
  it "パスワードと再確認用パスワードが異なる場合にfalse出力" do
    user = User.new(
      name:            "test",
      email:           "test@example.com",
      password:        "test1234",
      password_digest: "test"
    )
    expect(!user.save).to eq(false)
  end
  #ユーザーの重複エラー
end
