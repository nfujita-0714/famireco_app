require 'rails_helper'
RSpec.describe 'Userモデル機能', type: :model do
  describe 'バリデーションのテスト' do

    context '名前とメールアドレスとパスワードが入力された場合' do
      it "バリデーションが通る" do
        user = FactoryBot.build(:basic_user)
        expect(user).to be_valid
      end
    end
    context '名前が空の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:basic_user, name: nil)
        expect(user).not_to be_valid
      end
    end
    context '名前が255文字以上の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:basic_user, name: 'N'*256)
        expect(user).not_to be_valid
      end
    end
    context 'メールアドレスが空の場合' do
      it "バリデーションに引っかかる" do
        user = FactoryBot.build(:basic_user, email: nil)
        expect(user).not_to be_valid
      end
    end
    context '登録済みのメールアドレスを入力した場合' do
      it "バリデーションに引っかかる" do
        user = FactoryBot.create(:basic_user)
        repeat_user = FactoryBot.build(:basic2_user, email: 'basic_email@gmail.com')
        expect(repeat_user).not_to be_valid
      end
    end
    context 'パスワードが空の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:basic_user, email: nil)
        expect(user).not_to be_valid
      end
    end
    context 'パスワードが6文字未満の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.build(:basic_user, password: 'pass')
        expect(user).not_to be_valid
      end
    end
  end
end

