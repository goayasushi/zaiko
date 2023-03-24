require 'rails_helper'

RSpec.describe Sale, type: :model do
  before do
    @sale = FactoryBot.build(:sale)
  end

  describe '出荷登録' do
    context '出荷登録できる場合' do
      it 'sale_id,shipping_day,sale_quantity,user_idが存在していれば保存できる' do
        expect(@sale).to be_valid
      end
    end
    
    context '出荷登録できない場合' do
      it 'part_idが空では保存できない' do
        @sale.part = nil
        @sale.valid?
        expect(@sale.errors.full_messages).to include("Part must exist")
      end
      it 'shipping_dayが空では保存できない' do
        @sale.shipping_day = ''
        @sale.valid?
        expect(@sale.errors.full_messages).to include("Shipping day can't be blank")
      end
      it 'sale_quantityが空では保存できない' do
        @sale.sale_quantity = ''
        @sale.valid?
        expect(@sale.errors.full_messages).to include("Sale quantity can't be blank")
      end
      it 'sale_quantityが正の少数では保存できない' do
        @sale.sale_quantity = Faker::Number.between(from: 1.0, to: 9999999.0)
        @sale.valid?
        expect(@sale.errors.full_messages).to include("Sale quantity must be an integer")
      end
      it 'sale_quantityが0以下では保存できない' do
        @sale.sale_quantity = -1
        @sale.valid?
        expect(@sale.errors.full_messages).to include("Sale quantity is invalid")
      end
      it 'userが紐付いていないと保存できない' do
        @sale.user = nil
        @sale.valid?
        expect(@sale.errors.full_messages).to include('User must exist')
      end
    end
  end
end
