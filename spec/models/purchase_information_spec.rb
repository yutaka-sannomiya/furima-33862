require 'rails_helper'

RSpec.describe PurchaseInformation, type: :model do
  describe '購入情報の保存' do

    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_information_delivery = FactoryBot.build(:purchase_information_delivery, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_information_delivery).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_information_delivery.building = ''
        expect(@purchase_information_delivery).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "tokenが空では登録できないこと" do
        @purchase_information_delivery.token = nil
        @purchase_information_delivery.valid?
        expect(@purchase_information_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと保存できないこと' do
        @purchase_information_delivery.postal_code = ''
        @purchase_information_delivery.valid?
        expect(@purchase_information_delivery.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_information_delivery.postal_code = '1234567'
        @purchase_information_delivery.valid?
        expect(@purchase_information_delivery.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'shipping_area_id、１を選択すると保存できないこと' do
        @purchase_information_delivery.shipping_area_id = 1
        @purchase_information_delivery.valid?
        expect(@purchase_information_delivery.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it 'municipalitiesが空だと保存できないこと' do
        @purchase_information_delivery.municipalities = ''
        @purchase_information_delivery.valid?
        expect(@purchase_information_delivery.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @purchase_information_delivery.address = ''
        @purchase_information_delivery.valid?
        expect(@purchase_information_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it 'telが空だと保存できないこと' do
        @purchase_information_delivery.tel = ''
        @purchase_information_delivery.valid?
        expect(@purchase_information_delivery.errors.full_messages).to include("Tel can't be blank")
      end

    end
  end
end
