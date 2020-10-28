require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '購入情報保存' do
    context '購入情報が保存できるとき' do
      it 'すべての項目が正しく入力されていれば購入情報を保存できる' do
        expect(@order).to be_valid
      end
    end

    context '購入情報をが保存できないとき' do
      it '郵便番号が空では保存できない' do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがないと保存できない' do
        @order.postal_code = "0000000"
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-).")
      end
      it '都道府県が選択されていないと保存できない' do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture select")
      end
      it '市区町村が空だと保存できない' do
        @order.municipality = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空だと保存できない' do
        @order.details = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Details can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @order.tel = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel can't be blank")
      end
      it '電話番号が11桁以内でなければ保存できない' do
        @order.tel = "0120-00-000"
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel is invalid. Input half-width numbers.")
      end
    end
  end
end
