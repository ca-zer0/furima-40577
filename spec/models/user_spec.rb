require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "正常に登録できる" do
        expect(@user).to be_valid
      end
      it "passwordとpassword_confirmationが6文字以上あれば登録できる" do
        @user.password = 'test123'
        @user.password_confirmation = 'test123'
        expect(@user).to be_valid
      end
      it 'family_nameとfirst_nameが全角であれば登録できる' do
        @user.family_name = '坂東'
        @user.first_name = 'なおや'
        expect(@user).to be_valid
      end
      it 'family_name_keyとfirst_name_keyが全角であれば登録できる' do
        @user.family_name_key = 'バンドウ'
        @user.first_name_key = 'ナオヤ'
        expect(@user).to be_valid
      end
    end
    context '新規登録出来ない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが数字だけだと登録できない' do
        @user.password ='11111111'
        @user.password_confirmation = '11111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password パスワードには半角英字と半角数字の両方を含めて設定してください")
      end
      it 'passwordが英字だけだと登録できない' do
        @user.password = 'aaaaaaaa'
        @user.password_confirmation = 'aaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password パスワードには半角英字と半角数字の両方を含めて設定してください")
      end
      it 'passwordが全角だと登録できない' do
        @user.password = 'ああああああ'
        @user.password_confirmation = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password パスワードには半角英字と半角数字の両方を含めて設定してください")
      end
      it 'passwordとconfirmが一致していないと登録できない' do
        @user.password = 'test12345'
        @user.password_confirmation ='test98765'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが英数字混合でも6文字未満なら登録できない' do
        @user.password ='test1'
        @user.password_confirmation = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailには@が含まれていないと登録できない' do
        @user.email = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'family_nameが半角では登録できない' do
        @user.family_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name 全角ひらがな、全角カタカナ、漢字で入力してください")
      end 
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'First_nameが半角では登録できない' do
        @user.first_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角ひらがな、全角カタカナ、漢字で入力してください")
      end
      it 'family_name_keyが空では登録できない' do
        @user.family_name_key = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name key can't be blank")
      end
      it 'family_name_keyが半角では登録できない' do
        @user.family_name_key = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name key 全角カタカナで入力してください")
      end
      it 'first_name_keyが空では登録できない' do
        @user.first_name_key = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name key can't be blank")
      end
      it 'first_name_keyが半角では登録できない' do
        @user.first_name_key = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name key 全角カタカナで入力してください")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end