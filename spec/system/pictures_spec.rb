require 'rails_helper'
RSpec.describe 'Picture写真投稿機能', type: :system do
  before do
    @user01 = FactoryBot.create(:basic_user)
    @user02 = FactoryBot.create(:basic2_user)
    @picture01 = FactoryBot.create(:picture01, user: @user1)
    @picture02 = FactoryBot.create(:picture02, user: @user2)
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