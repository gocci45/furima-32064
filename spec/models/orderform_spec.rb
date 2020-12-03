require 'rails_helper'

RSpec.describe Orderform, type: :model do
  describe '#create' do
    before do
      sleep 1
      buyer = FactoryBot.create(:user)
      seller = FactoryBot.create(:user)
      item = FactoryBot.create(:item , user_id: seller.id)
      @orderform = FactoryBot.build(:orderform , user_id: buyer.id , item_id: item.id)
    end

    it '全ての条件が揃っている' do
      expect(@orderform).to be_valid
    end

    it '郵便番号が空欄だと保存できない' do
      @orderform.post_number = nil
      @orderform.valid?
      expect(@orderform.errors.full_messages).to include("Post number can't be blank")
    end

    it '郵便番号が半角ハイフンなしだと保存できない' do
      @orderform.post_number = '1234567'
      @orderform.valid?
      expect(@orderform.errors.full_messages).to include("Post number is invalid")
    end

    it '郵便番号が指定の文字数以上だと保存できない' do
      @orderform.post_number = '1111-11111'
      @orderform.valid?
      expect(@orderform.errors.full_messages).to include("Post number is invalid")
    end

    it '発送元地域の情報が空欄だと保存できない' do
      @orderform.shipping_address_id = nil
      @orderform.valid?
      expect(@orderform.errors.full_messages).to include("Shipping address is not a number")
    end

    it '発送元地域の情報が横棒だと保存されない' do
      @orderform.shipping_address_id = 1
      @orderform.valid?
      expect(@orderform.errors.full_messages).to include
    end

    it '市町村が空欄だと保存できない' do
      @orderform.city = nil
      @orderform.valid?
      expect(@orderform.errors.full_messages).to include("City can't be blank")
    end

    it '番地の情報が横棒だと保存されない' do
      @orderform.city_number = nil
      @orderform.valid?
      expect(@orderform.errors.full_messages).to include("City number can't be blank")
    end

    it '建物の情報は空欄でも保存できる' do
      @orderform.building = nil
      expect(@orderform).to be_valid
    end

    it '電話番号が空欄だと保存できない' do
      @orderform.tel_number = nil
      @orderform.valid?
      expect(@orderform.errors.full_messages).to include("Tel number can't be blank")
    end

    it '電話番号が全角数字だと保存されない' do
      @orderform.tel_number = '１２３４５'
      @orderform.valid?
      expect(@orderform.errors.full_messages).to include("Tel number is invalid")
    end
  
    it "tokenが空では登録できないこと" do
      @orderform.token = nil
      @orderform.valid?
      expect(@orderform.errors.full_messages).to include("Token can't be blank")
    end

    it '電話番号が12けたの場合保存できない' do
      @orderform.tel_number = 111111111111
      @orderform.valid?
      expect(@orderform.errors.full_messages).to include("Tel number is invalid")
    end

  end
end
