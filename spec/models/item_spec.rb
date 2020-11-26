require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全ての条件が揃っている' do
      expect(@item).to be_valid
    end

    it '商品名が空欄だと保存できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が空欄だと保存できない' do
      @item.text = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it 'カテゴリーの情報が空欄だと保存できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'カテゴリーの情報が横棒だと保存されない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include
    end

    it '商品状態の情報が空欄だと保存できない' do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it '商品状態の情報が横棒だと保存されない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include
    end

    it '配送料の情報が空欄だと保存できない' do
      @item.cost_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Cost can't be blank")
    end

    it '配送料の情報が横棒だと保存されない' do
      @item.cost_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include
    end

    it '発送元地域の情報が空欄だと保存できない' do
      @item.shipping_address_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping address can't be blank")
    end

    it '発送元地域の情報が横棒だと保存されない' do
      @item.shipping_address_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include
    end

    it '発送までの日数の情報が空欄だと保存できない' do
      @item.shipping_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
    end

    it '発送までの日数の情報が横棒だと保存されない' do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include
    end

    it '価格の情報が空欄だと保存できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格の情報が全角数字だと保存されない' do
      @item.price = '１２３４５'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it '価格の情報が300円未満だと保存されない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 299")
    end

    it '価格の情報が10000000円以上だと保存されない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 10000000")
    end

    it 'userが紐づいていないと保存できない'do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end

    it '画像が空欄だと保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  end
end
