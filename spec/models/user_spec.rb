require 'rails_helper'
RSpec.describe 'Userモデル機能', type: :model do
  describe 'バリデーションのテスト' do

    context '名前とメールアドレスとパスワードが入力された場合' do
      it "バリデーションが通る" do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end
    end
    context '名前が空の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user, name: nil)
        expect(user).not_to be_valid
      end
    end
    context '名前が255文字以上の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user, name: 'N'*256)
        expect(user).not_to be_valid
      end
    end
    context 'メールアドレスが空の場合' do
      it "バリデーションに引っかかる" do
        user = FactoryBot.build(:user, email: nil)
        expect(user).not_to be_valid
      end
    end
    context '登録済みのメールアドレスを入力した場合' do
      it "バリデーションに引っかかる" do
        user = FactoryBot.create(:user)
        repeat_user = FactoryBot.build(:user2, email: 'user01@example.com')
        expect(repeat_user).not_to be_valid
      end
    end
    context 'パスワードが空の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user, email: nil)
        expect(user).not_to be_valid
      end
    end
    context 'パスワードが6文字未満の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:user, password: 'pass')
        expect(user).not_to be_valid
      end
    end
  end
end

