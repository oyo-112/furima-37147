require 'rails_helper'

RSpec.describe PurchaseRecordsDeliveryAddresses, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @purchase_records_delivery_addresses = FactoryBot.build(:purchase_records_delivery_addresses, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it 'クレジットカード情報、配送先が入力されている' do
        expect(@purchase_records_delivery_addresses).to be_valid
      end
      it "建物名が空でも購入できる" do
        @purchase_records_delivery_addresses.building_name = ''
        @purchase_records_delivery_addresses.valid?
        expect(@purchase_records_delivery_addresses).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'postal_codeが空では登録できない' do
        @purchase_records_delivery_addresses.postal_code = ''
        @purchase_records_delivery_addresses.valid?
        expect(@purchase_records_delivery_addresses.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が半角のハイフンを含んでいないと購入できない' do
        @purchase_records_delivery_addresses.postal_code = '123ー4567'
        @purchase_records_delivery_addresses.valid?
        expect(@purchase_records_delivery_addresses.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県に「---」が選択されている場合は購入できない' do
        @purchase_records_delivery_addresses.prefecture_id = 1
        @purchase_records_delivery_addresses.valid?
        expect(@purchase_records_delivery_addresses.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '市区町村が空では購入できない' do
        @purchase_records_delivery_addresses.city = ''
        @purchase_records_delivery_addresses.valid?
        expect(@purchase_records_delivery_addresses.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では購入できない' do
        @purchase_records_delivery_addresses.address = ''
        @purchase_records_delivery_addresses.valid?
        expect(@purchase_records_delivery_addresses.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では購入できない' do
        @purchase_records_delivery_addresses.phone_number = ''
        @purchase_records_delivery_addresses.valid?
        expect(@purchase_records_delivery_addresses.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @purchase_records_delivery_addresses.phone_number = '００００００００aaa'
        @purchase_records_delivery_addresses.valid?
        expect(@purchase_records_delivery_addresses.errors.full_messages).to include("Phone number is not a number")
      end
      it '電話番号が11桁以下の半角数値でなければ購入できない' do
        @purchase_records_delivery_addresses.phone_number = '０００００００００００'
        @purchase_records_delivery_addresses.valid?
        expect(@purchase_records_delivery_addresses.errors.full_messages).to include("Phone number is not a number")
      end
      it "tokenが空では購入できない" do
        @purchase_records_delivery_addresses.token = nil
        @purchase_records_delivery_addresses.valid?
        expect(@purchase_records_delivery_addresses.errors.full_messages).to include("Token can't be blank")
      end
      it "ユーザーが紐付いていなければ購入できない" do
        @purchase_records_delivery_addresses.user_id = nil
        @purchase_records_delivery_addresses.valid?
        expect(@purchase_records_delivery_addresses.errors.full_messages).to include("User can't be blank")
      end
      it "商品が紐付いていなければ購入できない" do
        @purchase_records_delivery_addresses.item_id = nil
        @purchase_records_delivery_addresses.valid?
        expect(@purchase_records_delivery_addresses.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
