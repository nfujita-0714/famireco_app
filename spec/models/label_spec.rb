require 'rails_helper'
RSpec.describe 'Labelモデル機能', type: :model do
  describe 'バリデーションのテスト' do

    context 'ラベル名が入力された場合' do
      it "バリデーションが通る" do
        label = FactoryBot.build(:label01)
        expect(label).to be_valid
      end
    end
    context 'ラベル名が入力されずに登録しようとした場合' do
      it "バリデーションが通らない" do
        label = FactoryBot.build(:label01, name: nil)
        expect(label).not_to be_valid
      end
    end
  end
end