require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全てのデータが正しく保存された' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailの＠なしは登録できないこと' do
      @user.email = 'aiueo.ne.jp'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = 'A12345'
      @user.password_confirmation = 'A12345'
      expect(@user).to be_valid
    end

    it 'passwordが５文字以下では登録できないこと' do
      @user.password = 'aiu12'
      @user.password_confirmation = 'aiu12'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'passwordは確認用も含め２回入力しないとは登録できないこと' do
      @user.password = 'aiu123'
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include
    end

    it 'passwordは確認以外も含め２回入力しないとは登録できないこと' do
      @user.password = nil
      @user.password_confirmation = 'aiu123'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = 'A123456'
      @user.password_confirmation = 'B123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが数字のみでは登録できないこと' do
      @user.password = 11_111_111
      @user.password_confirmation = 11_111_111
      @user.valid?
      expect(@user.errors.full_messages).to include
    end

    it 'passwordが英字では登録できないこと' do
      @user.password = 'aaaaaaaa'
      @user.password_confirmation = 'aaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include
    end

    it '苗字が空白では登録できないこと' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it '苗字が全角以外では登録できないこと' do
      @user.family_name = 'ｱｲｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end

    it '苗字が英数字では登録できないこと' do
      @user.family_name = 'ａ１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end

    it '名前が空白では登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it '名前が全角以外では登録できないこと' do
      @user.first_name = 'ｱｲｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it '名前が英数字では登録できないこと' do
      @user.first_name = 'ａ１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it 'カタカナ苗字がカタカナ以外では登録できないこと' do
      @user.family_katakana = 'アイウエオ'
      expect(@user).to be_valid
    end

    it 'カタカナ苗字が半角では登録できないこと' do
      @user.first_katakana = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First katakana is invalid")
    end

    it 'カタカナ名前がカタカナ以外では登録できないこと' do
      @user.first_katakana = 'アイウエオ'
      expect(@user).to be_valid
    end

    it 'カタカナ苗字が半角では登録できないこと' do
      @user.first_katakana = 'ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First katakana is invalid")
    end

    it '生年月日が空白では登録できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
