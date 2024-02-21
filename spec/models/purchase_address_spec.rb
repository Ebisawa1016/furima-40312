require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
end

describe '住所の登録' do
  context '購入ができる場合' do
    it "すべての情報が正しく入力できていれば購入ができる" do
      expect(@purchase_address).to be_valid
    end
  end
  context '購入ができない場合' do
    it "tokenが空では登録できないこと" do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end

    it "郵便番号が空では登録できない" do
      @purchase_address.postal_code = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it "市町村が空では登録できない" do
      @purchase_address.city = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end

    it "番地が空では登録できない" do
      @purchase_address.street_address = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Street address can't be blank")
    end

    it "郵便番号はハイフンがないと登録できない" do
      @purchase_address.postal_code =1234567
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it "発送元の地域を選択しないと登録できない" do
      @purchase_address.prefecture_id = '1'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it "電話番号は空では登録できない" do
      @purchase_address.phone_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it "電話番号は数字以外では登録できない" do
      @purchase_address.phone_number = "あいうえおかきくけこ"
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. Input half-width numbers")
    end

    it "電話番号は9文字以下では登録できない" do
      @purchase_address.phone_number = 123456789
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
    end

    it '建物名が空でも保存できること' do
      @purchase_address.building_name = nil
      expect(@purchase_address).to be_valid
    end

    it "userが空の場合登録できない" do
      @purchase_address.user_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("User can't be blank")
    end

    it "userが空の場合登録できない" do
      @purchase_address.item_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
    end

   end
 end
end