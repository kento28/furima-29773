require 'rails_helper'
describe OrderAddress, type: :model do
  before do
    buyer = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, item_id: item.id, user_id: buyer.id)
    sleep 1
  end

  describe '商品購入' do
    context '購入が成功したとき' do
      it 'order,prefecture_id,city,address1,telephone,itemが存在すれば購入できる' do
        expect(@order_address).to be_valid
      end
    end

    context '購入が失敗したとき' do
      it 'orderが空だと購入できない' do
        @order_address.postal = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal can't be blank", 'Postal is invalid')
      end
      it 'orderにハイフン（-）を含まないと購入できない' do
        @order_address.postal = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal is invalid")
      end
      it 'prefecture_idが空だと購入できない' do
        @order_address.prefecture_id = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture Select')
      end
      it 'prefecture_idが0だと購入できない' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture Select')
      end
      it 'cityが空だと購入できない' do
        @order_address.city = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'address1が空だと購入できない' do
        @order_address.address1 = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address1 can't be blank")
      end
      it 'telephoneが空だと購入できない' do
        @order_address.telephone = ' '
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneが11桁以上だと購入できない' do
        @order_address.telephone = '123456789100'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include()
      end
      it 'telephoneにハイフン（-）が含まれると購入できない' do
        @order_address.telephone = '123-4567-891'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include()
      end
    end
  end
end