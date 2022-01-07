require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end
  
  describe '商品購入情報の保存' do
  context '内容に問題がない場合' do
    it "すべての値が正しく入力されていれば保存できる" do
      expect(@order_address).to be_valid
    end
    it 'buliding_nameは空でも保存できる' do
      @order_address.buliding_name = ''
      expect(@order_address).to be_valid
    end
  end

    context '内容に問題がある場合' do
      it 'post_numberが空だと保存できない' do
        @order_address.post_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post number can't be blank")
      end
      it 'post_numberにハイフンが入っていないと保存できない' do
        @order_address.post_number = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post number is invalid")
      end
      it 'shipping_area_idの値が1のときは保存できない' do
        @order_address.shipping_area_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'city_town_villageが空だと保存できない' do
        @order_address.city_town_village = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City town village can't be blank")
      end
      it 'address_numberが空だと保存できない' do
        @order_address.address_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address number can't be blank")
      end
      it 'tel_numberが空だと保存できない' do
        @order_address.tel_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number can't be blank")
      end
      it 'tel_numberが全角だと保存できない' do
        @order_address.tel_number = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number is invalid")
      end
      it 'tokenが空だと保存できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end