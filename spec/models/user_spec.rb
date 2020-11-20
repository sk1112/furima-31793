require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe User do
    describe 'ユーザー新規登録' do
      context '新規登録ができるとき' do
        it '全ての項目が入力されていれば登録できること' do
          expect(@user).to be_valid
        end

        it 'nicknameが20文字以内で入力されていれば登録できること' do
          @user.nickname = '鈴木功成'
          expect(@user).to be_valid
        end

        it '@を含むemailが入力されていれば登録できること' do
          @user.email = 'ks011012@gmail.com'
          expect(@user).to be_valid
        end

        it 'passwordが6文字以上の半角英数字で、password_confirmationと値が一致していれば登録できること' do
          @user.password = 'tech31793'
          @user.password_confirmation = 'tech31793'
          @user.password == @user.password_confirmation
          expect(@user).to be_valid
        end

        it 'family_nameが全角(漢字・ひらがな・カタカナ)入力であれば登録できること' do
          @user.family_name
          expect(@user).to be_valid
        end

        it 'first_nameが全角(漢字・ひらがな・カタカナ)入力であれば登録できること' do
          @user.first_name
          expect(@user).to be_valid
        end

        it 'family_name_kanaが全角(カタカナ)入力であれば登録できること' do
          @user.family_name_kana
          expect(@user).to be_valid
        end

        it 'first_name_kanaが全角(カタカナ)入力であれば登録できること' do
          @user.first_name_kana
          expect(@user).to be_valid
        end
      end

      context '新規登録ができないとき' do
        it 'nicknameが入力されていない場合は登録できないこと' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors[:nickname]).to include('を入力してください')
        end

        it 'nicknameが21文字以上で入力されている場合は登録できないこと' do
          @user.nickname = '鈴木功成鈴木功成鈴木功成鈴木功成鈴木功成鈴木功成'
          expect(@user.errors[:nickname]).not_to include('を入力してください')
        end

        it 'emailが入力されていない場合は登録できないこと' do
          @user.email = ''
          @user.valid?
          expect(@user.errors[:email]).to include('を入力してください')
        end

        it 'emailが@マークが含まれていないと登録できないこと' do
          @user.email = 'ks011012.gmail.com'
          expect(@user.errors[:email]).not_to include('は不正な値です')
        end

        it '重複したemailが入力されている場合は登録できないこと' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors[:email]).to include('はすでに存在します')
        end

        it 'passwordが入力されていない場合は登録できないこと' do
          @user.password = ''
          @user.valid?
          expect(@user.errors[:password]).to include('を入力してください')
        end

        it 'passwordが5文字以下の場合は登録できないこと' do
          @user.password = 'xyz99'
          @user.password_confirmation = 'xyz99'
          @user.valid?
          expect(@user.errors[:password]).to include('は6文字以上で入力してください')
        end

        it 'passwordが英語のみでは登録できないこと' do
          @user.password = 'techcamp'
          @user.password_confirmation = 'techcamp'
          expect(@user.errors[:password]).not_to include('は不正な値です')
        end

        it 'passwordが数字のみでは登録できないこと' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          expect(@user.errors[:password]).not_to include('は不正な値です')
        end

        it 'passwordが全角では登録できないこと' do
          @user.password = 'ｔｅｃｈ３１７９３'
          @user.password_confirmation = 'ｔｅｃｈ３１７９３'
          expect(@user.errors[:password]).not_to include('は不正な値です')
        end

        it 'passwordが存在してもpassword_confirmationが空では登録できない' do
          @user.password = 'tech31793'
          @user.password_confirmation = ''
          expect(@user.errors[:password_confirmation]).not_to include('は不正な値です')
        end

        it 'family_nameが入力されていない場合は登録できないこと' do
          @user.family_name = nil
          @user.valid?
          expect(@user.errors[:family_name]).to include('を入力してください')
        end

        it 'first_nameが入力されていない場合は登録できないこと' do
          @user.first_name = nil
          @user.valid?
          expect(@user.errors[:first_name]).to include('を入力してください')
        end

        it 'family_name_kanaが入力されていない場合は登録できないこと' do
          @user.family_name_kana = nil
          @user.valid?
          expect(@user.errors[:family_name_kana]).to include('を入力してください')
        end

        it 'first_name_kanaが入力されていない場合は登録できないこと' do
          @user.first_name_kana = nil
          @user.valid?
          expect(@user.errors[:first_name_kana]).to include('を入力してください')
        end

        it 'birthdayが入力されていない場合は登録できないこと' do
          @user.birthday = nil
          @user.valid?
          expect(@user.errors[:birthday]).to include('を入力してください')
        end

        it 'family_nameが全角入力でなければ登録できないこと' do
          @user.family_name = 'ｱｲｳｴｵ'
          @user.valid?
          expect(@user.errors[:family_name]).to include('は不正な値です')
        end

        it 'first_nameが全角入力でなければ登録できないこと' do
          @user.first_name = 'ｱｲｳｴｵ'
          @user.valid?
          expect(@user.errors[:first_name]).to include('は不正な値です')
        end

        it 'family_name_kanaが全角カタカナ入力でなければ登録できないこと' do
          @user.family_name_kana = 'あいうえお'
          @user.valid?
          expect(@user.errors[:family_name_kana]).to include('は不正な値です')
        end

        it 'first_name_kanaが全角カタカナ入力でなければ登録できないこと' do
          @user.first_name_kana = 'あいうえお'
          @user.valid?
          expect(@user.errors[:first_name_kana]).to include('は不正な値です')
        end
      end
    end
  end
end
