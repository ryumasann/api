require 'rails_helper'

RSpec.describe Article, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'create' do
    # FactoryBotを使ってbookを作成
    let(:article) { FactoryBot.build(:article) }

    # まずは正しいデータが作成されるかをテスト
    context 'with valid attributes' do
      it 'is valid with a title' do
        expect(article).to be_valid
      end
    end

    # 異常系のテスト
    context 'with invalid attributes' do
      # titleがない場合のテスト
      it 'is invalid without a title' do
        article.title = nil
        expect(article.invalid?).to eq false
      end
    end
  end
end
