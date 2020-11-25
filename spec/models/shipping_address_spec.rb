require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  describe '#create' do
    before do
      @shipping_address = FactoryBot.build(:shipping_address)
    end

    describe '商品配送先登録' do
      context '商品配送先登録ができるとき' do
        it 'postal_code,prefecture_id,city,detailed_address,phone_number,purchase_record_idが存在すれば登録できる' do
          expect(@shipping_address).to be_valid
        end
      end

      context '商品配送先登録ができないとき' do
        it 'postal_codeが空だと登録できない' do
          @shipping_address.postal_code = ''
          expect(@shipping_address.errors.full_messages).not_to include('郵便番号を入力してください')
        end
        it 'postal_codeがハイフンが無いと登録できない' do
          @shipping_address.postal_code = '1234567'
          expect(@shipping_address.errors.full_messages).not_to include('郵便番号は不正な値です')
        end
        it 'postal_codeが整数以外だと登録できない' do
          @shipping_address.postal_code = 'abc-efgh'
          expect(@shipping_address.errors.full_messages).not_to include('郵便番号は不正な値です')
        end
        it 'prefecture_idが空だと登録できない' do
          @shipping_address.prefecture_id = ''
          expect(@shipping_address.errors.full_messages).not_to include('都道府県を入力してください')
        end
        it "prefecture_idが'--'だと登録できない" do
          @shipping_address.prefecture_id = 1
          expect(@shipping_address.errors.full_messages).not_to include('都道府県は数値で入力してください')
        end
        it 'cityが空だと登録できない' do
          @shipping_address.city = ''
          expect(@shipping_address.errors.full_messages).not_to include('市区町村を入力してください')
        end
        it 'detailed_addressが空だと登録できない' do
          @shipping_address.detailed_address = ''
          expect(@shipping_address.errors.full_messages).not_to include('番地を入力してください')
        end
        it 'phone_numberが空だと登録できない' do
          @shipping_address.phone_number = ''
          expect(@shipping_address.errors.full_messages).not_to include('電話番号を入力してください')
        end
        it 'phone_numberが整数以外だと登録できない' do
          @shipping_address.phone_number = 'abcdefghijk'
          expect(@shipping_address.errors.full_messages).not_to include('電話番号は不正な値です')
        end
        it 'phone_numberにハイフンがあると登録できない' do
          @shipping_address.phone_number = '03-123-4567'
          expect(@shipping_address.errors.full_messages).not_to include('電話番号はハイフン無しで登録してください')
        end
        it 'phone_numberが12桁以上だと登録できない' do
          @shipping_address.phone_number = '090123456789'
          expect(@shipping_address.errors.full_messages).not_to include('電話番号は11文字以内で入力してください')
        end
      end
    end
  end
end
