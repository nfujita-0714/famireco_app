require 'rails_helper'

RSpec.describe '投稿お気に入り機能', type: :system do
  before do
    @user01 = FactoryBot.create(:basic_user)
    @user02 = FactoryBot.create(:basic2_user)
    @picture01 = FactoryBot.create(:picture01, user: @user01)
    @picture02 = FactoryBot.create(:picture02, user: @user02)
  end

  describe 'お気に入り登録機能' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'basic_email@gmail.com'
      fill_in 'user[password]', with: 'password'
      click_button 'ログイン'
      visit picture_path(@picture02)
    end
    context 'お気に入りするをクリックした場合' do
      it 'お気に入り一覧に追加される' do
        click_on 'お気に入りする'
        visit user_path(@user01)
        click_on 'お気に入り一覧'
        expect(page).to have_content 'picture02'
      end
    end
    context 'お気に入り削除ボタンを押した場合' do
      before do
        click_on 'お気に入りする'
        visit user_path(@user01)
        click_on 'お気に入り一覧'
      end
      it 'お気に入り一覧から削除される' do
        click_on 'お気に入り解除する'
        visit user_path(@user01)
        click_on 'お気に入り一覧'
        expect(page).to have_no_content 'picture02'
      end
    end
  end
end
