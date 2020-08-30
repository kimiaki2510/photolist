require 'rails_helper'

#新規登録テスト
RSpec.describe User, type: :model do
  it "ユーザー作成が有効であるか(プロフィール写真なし)" do
    user = User.new(
      name: "ああああああああああ",
      email: "taniguchi@techacademy.com",
      password: "taniguchi",
      password_digest: "taniguchi",
    )
    expect(user).to be_valid
  end

  #メールアドレスの小文字化
  #パスワードのハッシュ値を返しているか
  #自分自身でないか
  #すでにフォローしているか

end
