require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @user_order = FactoryBot.build(:user_order, item_id: item.id, user_id: user.id)
      sleep 0.1
    end

    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user_order).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @user_order.user_id = 1
        expect(@user_order).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @user_order.item_id = 1
        expect(@user_order).to be_valid
      end
      it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
        @user_order.post_code = '123-4560'
        expect(@user_order).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @user_order.prefecture_id = 2
        expect(@user_order).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @user_order.city = '横浜市'
        expect(@user_order).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @user_order.address = '緑区１２３'
        expect(@user_order).to be_valid
      end
      it '建物名が空でも保存できる' do
        @user_order.building_name = nil
        expect(@user_order).to be_valid
      end
      it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
        @user_order.phone_number = 12_345_678_910
        expect(@user_order).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @user_order.user_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @user_order.item_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @user_order.post_code = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @user_order.post_code = 1_234_567
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '都道府県が空だと保存できないこと' do
        @user_order.prefecture_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が「---」だと保存できないこと' do
        @user_order.prefecture_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @user_order.city = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @user_order.address = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @user_order.phone_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @user_order.phone_number = '123 - 1234 - 1234'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @user_order.phone_number = 12_345_678_910_123
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が9桁以下だと保存できないこと' do
        @user_order.phone_number = 12_345_678
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number is invalid')
      end
      it 'トークンが空だと保存できないこと' do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end