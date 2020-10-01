require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  before do
    @order_shipping_address = FactoryBot.build(:order_shipping_address)
  end

  describe 'order情報の保存' do
    it '全ての情報が正しく入力されていれば保存出来ること' do
      expect(@order_shipping_address).to be_valid
    end
    it 'postal_codeが空だと保存ができない' do
      @order_shipping_address.postal_code = ''
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeにハイフンがなければ保存できない' do
      @order_shipping_address.postal_code = '1111111'
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include('Postal code include hypone')
    end
    it 'prefecturesを選択していないと保存ができない' do
      @order_shipping_address.prefectures = ''
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Prefectures can't be blank")
    end
    it 'prefecturesが1だと保存ができない' do
      @order_shipping_address.prefectures = 1
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Prefectures can't be blank")
    end
    it 'cityが空だと保存ができない' do
      @order_shipping_address.city = ''
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存ができない' do
      @order_shipping_address.address = ''
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Address can't be blank")
    end
    it 'building_nameが空でも保存が出来る' do
      @order_shipping_address.building_name = ''
      expect(@order_shipping_address).to be_valid
    end
    it 'phoneが空だと保存ができない' do
      @order_shipping_address.phone = ''
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Phone can't be blank")
    end
    it 'phoneにハイフンがあると保存ができない' do
      @order_shipping_address.phone = '090-1111-'
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include('Phone numerical value only')
    end
    it 'phoneが12桁以上だと保存ができない' do
      @order_shipping_address.phone = '090123456789'
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include('Phone is too long (maximum is 11 characters)')
    end
    it 'tokenがないと保存ができない' do
      @order_shipping_address.token = ''
      @order_shipping_address.valid?
      expect(@order_shipping_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
