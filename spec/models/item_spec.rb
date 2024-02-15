require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '出品ができる場合' do
      it "すべての情報が正しく入力できていれば出品ができる" do
        expect(@item).to be_valid
      end
    end
    context '出品ができない場合' do
      it "商品の画像が無しでは登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品名が空の場合では登録できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it "商品の説明が空の場合登録できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "カテゴリーを選択しないと登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end

      it "商品の状態を選択しないと登録できない" do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not a number")
      end

      it "配送料の負担を選択しないと登録できない" do
        @item.shipping_fee_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee burden is not a number")
      end

      it "発送元の地域を選択しないと登録できない" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end

      it "発送までの日数を選択しないと登録できない" do
        @item.shipping_duration_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping duration is not a number")
      end

      it "値段を空では登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end

      it "¥最低でも300円以上の価格にしないとだめ" do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "¥最低でも9999999円以下の価格にしないとだめ" do
        @item.price = 99999999
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it "価格は半角数値のみ保存可能である" do
        @item.price = "abcdef"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

    end
  end
end