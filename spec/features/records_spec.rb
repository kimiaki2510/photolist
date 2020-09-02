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
  context 'ログイン成功' do
    before do
      let(:user){user.password}
      it '成功時のflashが表示される' do
        expect(page).to have_css('div', class: 'alert-success')
      end
    end
  end

  context 'ログイン失敗' do
    before do
      let(:password) {'badpassword'}
      it '失敗時のflashが表示される' do
        expect(page).to have_css('div', class: 'alert-danger')
      end
    end
  end
end
