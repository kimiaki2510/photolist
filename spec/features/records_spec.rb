require 'rails_helper'

RSpec.feature "Records", type: :feature do
  let(:user){FactoryBot.create(:user)}

#メールアドレスとパスワードを入力し、ログインする
  describe 'ログイン', type: :system do
    before do
      visit root_path
      click_link "ログイン"
      fill_in "メールアドレス", with: @user.email
      fill_in "パスワード", with: user.password
      click_button "ログインする"
    end
  end
end
