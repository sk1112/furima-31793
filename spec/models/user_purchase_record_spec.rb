require 'rails_helper'

RSpec.describe UserPurchaseRecord, type: :model do
  describe '#create' do
    before do
      @user_purchase_record = FactoryBot.build(:user_purchase_record)
    end

    describe '商品配送先登録' do
      context '商品配送先登録ができるとき' do
        it 'token,postal_code,prefecture_id,city,detailed_address,phone_number,purchase_record_idが存在すれば登録できる' do
          expect(@user_purchase_record).to be_valid
        end
      end

      context '商品配送先登録ができないとき' do
        it 'postal_codeが空だと登録できない' do
          @user_purchase_record.postal_code = ''
          @user_purchase_record.valid?
          expect(@user_purchase_record.errors.full_messages).to include('郵便番号を入力してください')
        end
        it 'postal_codeがハイフンが無いと登録できない' do
          @user_purchase_record.postal_code = '1234567'
          @user_purchase_record.valid?
          expect(@user_purchase_record.errors.full_messages).to include('郵便番号は不正な値です')
        end
        it 'postal_codeが整数以外だと登録できない' do
          @user_purchase_record.postal_code = 'abc-efgh'
          @user_purchase_record.valid?
          expect(@user_purchase_record.errors.full_messages).to include('郵便番号は不正な値です')
        end
        it 'prefecture_idが空だと登録できない' do
          @user_purchase_record.prefecture_id = ''
          @user_purchase_record.valid?
          expect(@user_purchase_record.errors.full_messages).to include('都道府県を入力してください')
        end
        it "prefecture_idが'--'だと登録できない" do
          @user_purchase_record.prefecture_id = 1
          expect(@user_purchase_record.errors.full_messages).not_to include('都道府県は数値で入力してください')
        end
        it 'cityが空だと登録できない' do
          @user_purchase_record.city = ''
          @user_purchase_record.valid?
          expect(@user_purchase_record.errors.full_messages).to include('市区町村を入力してください')
        end
        it 'detailed_addressが空だと登録できない' do
          @user_purchase_record.detailed_address = ''
          @user_purchase_record.valid?
          expect(@user_purchase_record.errors.full_messages).to include('番地を入力してください')
        end
        it 'phone_numberが空だと登録できない' do
          @user_purchase_record.phone_number = ''
          @user_purchase_record.valid?
          expect(@user_purchase_record.errors.full_messages).to include('電話番号を入力してください')
        end
        it 'phone_numberが整数以外だと登録できない' do
          @user_purchase_record.phone_number = 'abcdefghijk'
          @user_purchase_record.valid?
          expect(@user_purchase_record.errors.full_messages).to include('電話番号は不正な値です')
        end
        it 'phone_numberにハイフンがあると登録できない' do
          @user_purchase_record.phone_number = '03-123-4567'
          @user_purchase_record.valid?
          expect(@user_purchase_record.errors.full_messages).to include('電話番号はハイフン無しで登録してください')
        end
        it 'phone_numberが12桁以上だと登録できない' do
          @user_purchase_record.phone_number = '090123456789'
          @user_purchase_record.valid?
          expect(@user_purchase_record.errors.full_messages).to include('電話番号は11文字以内で入力してください')
        end
        it 'tokenが空だと購入できない' do
          @user_purchase_record.token = ''
          @user_purchase_record.valid?
          expect(@user_purchase_record.errors.full_messages).to include('クレジットカード情報を入力してください')
        end
      end
    end
  end
end
