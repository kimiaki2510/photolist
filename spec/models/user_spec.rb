require 'rails_helper'

#新規登録テスト
RSpec.describe User, type: :model do
  it "ユーザー作成が有効であるか(プロフィール写真なし)" do
    user = FactoryBot.build(:user)
    user.valid?
    expect(user).to be_valid
  end
  #メールアドレスの小文字確認
  it "Test@example.comが小文字のtest@example.comになっているか" do
    user = FactoryBot.create(:user)
    expect(user.email).to eq 'test@example.com'
  end
  #パスワードのハッシュ値を返しているか(authenticateメソッド)
  #自分自身でないか
  #すでにフォローしているか
  #パスワードの再確認
end
