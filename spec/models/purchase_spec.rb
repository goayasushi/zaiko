require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end

  describe '入荷登録' do
    context '入荷登録できる場合' do
      it 'purchase_id,arrival_day,purchase_quantity,user_idが存在していれば保存できる' do
        expect(@purchase).to be_valid
      end
    end
    
    context '入荷登録できない場合' do
      it 'part_idが空では保存できない' do
        @purchase.part = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Part must exist")
      end
      it 'arrival_dayが空では保存できない' do
        @purchase.arrival_day = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Arrival day can't be blank")
      end
      it 'purchase_quantityが空では保存できない' do
        @purchase.purchase_quantity = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Purchase quantity can't be blank")
      end
      it 'purchase_quantityが正の少数では保存できない' do
        @purchase.purchase_quantity = Faker::Number.between(from: 1.0, to: 9999999.0)
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Purchase quantity must be an integer")
      end
      it 'purchase_quantityが0以下では保存できない' do
        @purchase.purchase_quantity = -1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Purchase quantity is invalid")
      end
      it 'userが紐付いていないと保存できない' do
        @purchase.user = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('User must exist')
      end
    end
  end
end
