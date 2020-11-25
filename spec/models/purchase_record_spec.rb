require 'rails_helper'

RSpec.describe PurchaseRecord, type: :model do
  describe '#create' do
    before do
      @purchase_record = FactoryBot.build(:purchase_record)
    end

    describe "商品購入登録" do
      context "商品購入登録ができるとき" do
        it "user_id,item_idが存在すれば登録できる" do
          expect(@purchase_record).to be_valid
        end
      end

      context "商品購入登録ができないとき" do
        it "ユーザーが紐付いていないと登録できない" do
          @purchase_record.user = nil
          @purchase_record.valid?
          expect(@purchase_record.errors.full_messages).to include("ユーザーを入力してください")
        end 
        it "商品が紐付いていないと登録できない" do
          @purchase_record.item = nil
          @purchase_record.valid?
          expect(@purchase_record.errors.full_messages).to include("商品を入力してください")
        end
      end
    end
  end
end
