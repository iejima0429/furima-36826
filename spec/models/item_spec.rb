require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できる場合' do
      it "item_name,item_info,item_category_id,item_status_id,item_delivery_free_id,shipping_area_id,days_to_ship_id,price,imageが存在したら商品が出品できる" do
        expect(@item).to be_valid
      end
    end
      context '商品の出品ができない時は出品できない' do
        it 'item_nameが空のとき' do
          @item.item_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end
        it 'item_infoが空のときは出品できない' do
          @item.item_info = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Item info can't be blank")
        end
        it 'item_category_idの値が1のときは出品できない' do
          @item.item_category_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Item category can't be blank")
        end
        it 'item_status_idの値が1のときは出品できない' do
          @item.item_status_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Item status can't be blank")
        end
        it 'item_delivery_free_idの値が1のときは出品できない' do
          @item.item_delivery_free_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Item delivery free can't be blank")
       
        end
        it 'shipping_area_idの値が1のときは出品できない' do
          @item.shipping_area_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping area can't be blank")
        end
        it 'days_to_ship_idの値が1のときは出品できない' do
          @item.days_to_ship_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Days to ship can't be blank")
        end
        it 'priceの値が300未満のときは出品できない' do
          @item.price = '299'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end
        it 'priceの値が10000000以上のときは出品できない' do
          @item.price = '10000000'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end
        it 'priceの値が半角数字でない場合は出品できない' do
          @item.price = 'abcd'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end
        it '画像が無い時は出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
      end
    end
  end