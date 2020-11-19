require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe Item do
    describe '商品出品' do
      context '商品出品ができるとき' do
        it '全ての項目が入力されていれば出品できること' do
          expect(@item).to be_valid
        end

        it 'nameが入力されていれば出品できること' do
          @item.name = "PS5"
          expect(@item).to be_valid
        end

        it 'descriptionが入力されていれば出品できること' do
          @item.description
          expect(@item).to be_valid
        end

        it 'priceの値が300〜9999999の範囲内であれば出品できること' do
          @item.price 
          expect(@item).to be_valid
        end

        it 'category_idが1以外を選択されていれば出品できること' do
          @item.category_id
          expect(@item).to be_valid
        end

        it 'condition_idが1以外を選択されていれば出品できること' do
          @item.condition_id
          expect(@item).to be_valid
        end

        it 'prefecture_idが1以外を選択されていれば出品できること' do
          @item.prefecture_id
          expect(@item).to be_valid
        end

        it 'delivery_day_idが1以外を選択されていれば出品できること' do
          @item.delivery_day_id
          expect(@item).to be_valid
        end

        it 'user_idが存在していれば出品できること' do
          @item.user_id
          expect(@item).to be_valid
        end

        it 'imageが選択されていれば出品できること' do
          @item.image
          expect(@item).to be_valid
        end
      end

      context '商品出品ができないとき' do
        it 'nameが入力されていない場合は出品できないこと' do
          @item.name = ""
          @item.valid?
          expect(@item.errors[:name]).to include('を入力してください')
        end

        it 'descriptionが入力されていない場合は出品できないこと' do
          @item.description = ""
          @item.valid?
          expect(@item.errors[:description]).to include('を入力してください')
        end

        it 'priceが入力されていない場合は出品できないこと' do
          @item.price = ""
          @item.valid?
          expect(@item.errors[:price]).to include('を入力してください')
        end

        it 'priceの値が300〜9999999の範囲内でない場合は出品できないこと' do
          @item.price = 10000000
          expect(@item.errors[:price]).not_to include('は不正な値です')
        end

        it 'priceが半角英数字以外で入力されている場合は出品できないこと' do
          @item.price = "５００００"
          expect(@item.errors[:price]).not_to include('は不正な値です')
        end

        it 'category_idが1を選択されていた場合は出品できないこと' do
          @item.category_id = 1
          expect(@item.errors[:category_id]).not_to include('は不正な値です')
        end

        it 'condition_idが1を選択されていた場合は出品できないこと' do
          @item.condition_id = 1
          expect(@item.errors[:condition_id]).not_to include('は不正な値です')
        end

        it 'prefecture_idが1を選択されていた場合は出品できないこと' do
          @item.prefecture_id = 1
          expect(@item.errors[:prefecture_id]).not_to include('は不正な値です')
        end

        it 'delivery_day_idが1を選択されていた場合は出品できないこと' do
          @item.delivery_day_id = 1
          expect(@item.errors[:delivery_day_id]).not_to include('は不正な値です')
        end

        it 'delivery_fee_idが1を選択されていた場合は出品できないこと' do
          @item.delivery_fee_id = 1
          expect(@item.errors[:delivery_fee_id]).not_to include('は不正な値です')
        end

        it 'user_idが存在しない場合は出品できないこと' do
          @item.user_id = ""
          expect(@item.errors[:user_id]).not_to include('が存在していません')
        end

        it 'imageが選択されていない場合は出品できないこと' do
          @item.image = ""
          expect(@item.errors[:image]).not_to include('を入力してください')
        end
      end
    end
  end
end
