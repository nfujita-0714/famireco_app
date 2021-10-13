require 'rails_helper'
RSpec.describe 'User機能テスト', type: :system do

  describe 'ユーザー登録のテスト' do
    context 'ユーザー登録をした場合' do
      it '新規登録ができる' do
        visit new_user_registration_path
        fill_in 'user[name]', with: 'new'
        fill_in 'user[email]', with: 'new@example.com'
        fill_in 'user[self_introduction]', with: 'new'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button "　　　　　登録　　　　　　"
        user = User.find_by(email: 'new@example.com')
        visit user_path(user.id)
        expect(page).to have_content 'new'
      end
    end
    # context 'ユーザーがログインしていない場合' do
    #   it 'グループ作成画面に飛ぼうとした時、ログイン画面に推移すること' do
    #   visit new_group_path
    #   expect(page).to have_content 'ログイン'
    #   end
    # end
  end
end