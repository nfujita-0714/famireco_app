require 'rails_helper'
RSpec.describe 'ラベル機能', type: :system do
  before do
    @user01 = FactoryBot.create(:basic_user)
    @user02 = FactoryBot.create(:basic2_user)
    @picture01 = FactoryBot.create(:picture01, user: @user01)
    @picture02 = FactoryBot.create(:picture02, user: @user01)
    @label01 = FactoryBot.create(:label01)
    @label02 = FactoryBot.create(:label02)
    FactoryBot.create(:labeling, picture: @picture01, label: @label01)
    FactoryBot.create(:labeling, picture: @picture02, label: @label02)
    visit new_user_session_path
    fill_in 'user[email]', with: 'basic_email@gmail.com'
    fill_in 'user[password]', with: 'password'
    click_button 'ログイン'
  end

  describe 'ラベル登録機能' do
    context '投稿を新規作成したとき' do
      it 'ラベルが投稿と一緒に登録される' do
        visit new_picture_path
        fill_in 'picture[content]', with: 'test'
        check 'picture_label_ids_1'
        click_on '登録する'
        expect(page).to have_content 'label01'
      end
    end
  end
  describe 'ラベル表示機能' do
    context '投稿詳細画面に飛んだ場合' do
      it '投稿につけたラベルの内容が表示される' do
        visit picture_path(@picture01)
        expect(page).to have_content 'label01'
      end
    end
  end
  describe '検索機能' do
    context 'ラベル検索をした場合' do
      it "検索したラベルがついているタスクが絞り込まれる" do
        select 'label01', from: 'q_labels_id_eq'
        click_button '検索'
        expect(page).to have_content 'label01'
      end
    end
  end
end