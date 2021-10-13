require 'rails_helper'
RSpec.describe 'ユーザー機能', type: :system do

  describe 'CRUD機能のテスト' do
    context '新規登録した場合' do
      it '登録が完了できる' do
      visit new_user_registration_path
      fill_in 'user[name]', with: 'new_user'
      fill_in 'user[email]', with: 'new@example.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      click_button "　　　　　登録　　　　　　"
      user = User.find_by(email: 'new@example.com')
      visit user_path(user.id)
      expect(page).to have_content 'new'
      end
    end
    context '情報を編集をした場合' do
      before do
        @user01 = FactoryBot.create(:basic_user)
        visit new_user_session_path
        fill_in 'user[email]', with: 'basic_email@gmail.com'
        fill_in 'user[password]', with: 'password'
        click_button 'ログイン'
      end
      it '編集ができること' do
        visit edit_user_registration_path
        fill_in 'user[name]', with: 'edit'
        fill_in 'user[current_password]', with: 'password'
        click_on '更新'
        expect(page).to have_content '変更しました'
      end
    end
    context 'ユーザー削除をした場合' do
      before do
        @user01 = FactoryBot.create(:basic_user)
        visit new_user_session_path
        fill_in 'user[email]', with: 'basic_email@gmail.com'
        fill_in 'user[password]', with: 'password'
        click_button 'ログイン'
      end
      it 'アカウントが削除できること' do
        visit user_path(@user01.id)
        click_button '削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'アカウントを削除しました'
      end
    end
  end
  describe 'ゲストログイン機能' do
    context '管理者としてゲストログインをした場合' do
      it 'ログインができ、マイページに遷移する' do
        visit root_path
        click_on '管理者ゲストログイン'
        expect(page).to have_content '管理者ゲストとしてログイン'
      end
    end
    context 'ゲストとしてログインをした場合' do
      it 'ログインができ、マイページに遷移する' do
        visit root_path
        click_on '　ゲストログイン　　'
        expect(page).to have_content 'ゲストとしてログイン'
      end
    end
  end

  describe 'ログイン機能のテスト' do
    before do
      FactoryBot.create(:basic_user)
    end
    context 'ユーザーが正しい情報でログインをした場合' do
      it '投稿一覧ページに飛べる' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'basic_email@gmail.com'
        fill_in 'user[password]', with: 'password'
        click_button 'ログイン'
        expect(page).to have_content '投稿一覧'
      end
    end
    context 'ログイン済みのユーザーがログアウトをした場合' do
      before do
        visit new_user_session_path
        fill_in 'user[email]', with: 'basic_email@gmail.com'
        fill_in 'user[password]', with: 'password'
        click_button 'ログイン'
      end
      it 'ログアウトでき、トップ画面に遷移する' do
        click_on 'ログアウト'
        expect(page).to have_content 'ログアウトしました'
      end
    end
  end

  describe 'ログインしていない場合のテスト' do
    context 'ログインせずに投稿一覧のurlを入力した場合' do
      it '投稿一覧へ行くことが出来ない' do
        visit pictures_path
        expect(page).to have_content 'ログインもしくはアカウント登録してください。'
      end
    end
  end
end