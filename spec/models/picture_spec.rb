require 'rails_helper'
RSpec.describe 'Picture投稿機能', type: :model do
  describe 'バリデーションのテスト' do
    before do
      @user = FactoryBot.create(:basic_user)
    end

    context 'content内容が空の場合' do
      it 'バリデーションに引っかかる' do
        picture = FactoryBot.build(:picture01, content: nil, user: @user)
        expect(picture).not_to be_valid
      end
    end
    context 'content内容が入力されているの場合' do
      it 'バリデーションが通る' do
        picture = FactoryBot.build(:picture01, user: @user)
        expect(picture).to be_valid
      end
    end
  end
end