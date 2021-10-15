require 'rails_helper'
RSpec.describe '投稿機能', type: :system do
  before do
    @user01 = FactoryBot.create(:basic_user)
    @user02 = FactoryBot.create(:basic2_user)
    @picture01 = FactoryBot.create(:picture01, user: @user01, created_at: '2021-10-10')
    @picture02 = FactoryBot.create(:picture02, user: @user02, created_at: '2021-09-10')
  end

  describe 'CRUD機能のテスト' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'basic_email@gmail.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'
    end
    context '新規投稿した場合' do
      it '登録が完了できる' do
        visit new_picture_path
        fill_in 'picture[content]', with: 'test'
        click_on '登録する'
        expect(page).to have_content '画像投稿しました'
      end
    end
    context '登録後、一覧画面に飛んだ場合' do
      it '投稿したものが表示される' do
        visit new_picture_path
        fill_in 'picture[content]', with: 'test'
        click_on '登録する'
        expect(page).to have_content 'test'
      end
    end
    context '編集した場合' do
      it '編集され、投稿詳細ページに飛ぶ' do
        visit edit_picture_path(@picture01)
        fill_in 'picture[content]', with: 'edit'
        click_button '更新する'
        expect(page).to have_content '投稿を編集しました'
        expect(page).to have_content '投稿詳細'
      end
    end
    context '投稿を削除した場合' do
      before do
        visit picture_path(@picture01)
      end
      it '削除され、投稿一覧ページに飛ぶ' do
        click_on '削除'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '投稿を削除しました'
        expect(page).to have_content '投稿一覧'
      end
    end
  end

  describe '検索機能テスト' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'basic_email@gmail.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'
    end
    context '投稿者検索の場合' do
      it '検索した投稿者の写真投稿が表示される' do
        fill_in 'q[user_name_cont]', with: 'basic2_name'
        click_on '検索'
        expect(page).to have_content 'basic2_name'
        expect(page).to have_no_content 'basic_name'
      end
    end
    context '投稿日で検索をした場合' do
      it '検索した投稿日の範囲の投稿のみが表示される' do
        fill_in 'q[created_at_gteq]', with: '2021-09-01'
        fill_in 'q[created_at_lteq]', with: '2021-09-30'
        click_on '検索'
        expect(page).to have_content '2021/09/10'
        expect(page).not_to have_content '2021/10/10'
      end
    end
  end

  describe 'アクセス制限に関するテスト' do
    context 'ログインしていない場合' do
      it '新規投稿画面に飛べず、投稿することができない' do
        visit new_picture_path
        expect(page).to have_content 'ログインもしくはアカウント登録してください'
      end
    end
    context 'ログイン後、他人の投稿を編集しようとした場合' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'basic_email@gmail.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'
    end
      it '編集することができない' do
        visit edit_picture_path(@picture02)
        expect(page).to have_content '他人の投稿は編集できません'
      end
    end
  end
end
