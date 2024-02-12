require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "last_name_kanjiが空では登録できない" do
        @user.last_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
      end

      it "first_name_kanjiが空では登録できない" do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank")
      end
      
      it "last_name_katakanaが空では登録できない" do
        @user.last_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end

      it "first_name_katakanaが空では登録できない" do
        @user.first_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end

      it "date_birthが空では登録できない" do
        @user.date_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date birth can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

        it "パスワードが６文字以上じゃないと登録できない" do
          @user.password = '12345'
          @user.password_confirmation = '12345'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end

        it "パスワードには英数字を含めて設定して欲しい" do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
        end

        it "last_name_kanjiに漢字、カタカナ、ひらがな以外が使用されている" do
          @user.last_name_kanji = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kanji is invalid. Input full-width characters.")
        end

        it "first_name_kanjiに漢字、カタカナ、ひらがな以外が使用されている" do
          @user.first_name_kanji = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kanji is invalid. Input full-width characters.")
        end

        it "last_name_katakanaにカタカナ以外が使用されている" do
          @user.last_name_katakana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name katakana is invalid. Input full-width katakana characters.")
        end

        it "first_name_katakanaにカタカナ以外が使用されている" do
          @user.first_name_katakana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name katakana is invalid. Input full-width katakana characters.")
        end
    end
  end
end