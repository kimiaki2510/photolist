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

  it '@userが有効であることの確認' do
      expect(@user).to be_valid
    end
    it 'nameが空白は無効' do
      @user.name = "     "
      expect(@user).to be_invalid
    end
    it "emailが空白は無効" do
      @user.email = "     "
      expect(@user).to be_invalid
    end
    it "password空白は無効" do
      @user.password = @user.password_confirmation = ""
      expect(@user).to be_invalid
    end

    it "name51文字以上は無効" do
      @user.name = "a" * 51
      expect(@user).to be_invalid
    end
    it "name50文字以下は有効" do
      @user.name = "a" * 50
      expect(@user).to be_valid
    end
    it "emailがすべて含めて51字以上は無効" do
      @user.email = "a" * 39 + "@example.com"
      expect(@user).to be_invalid
    end
    it "emailがすべて含めて50字以下は有効" do
      @user.email = "a" * 38 + "@example.com"
      expect(@user).to be_valid
    end
  #ユーザーの重複エラー
end
