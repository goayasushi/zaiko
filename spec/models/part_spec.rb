require 'rails_helper'

RSpec.describe Part, type: :model do
  before do
    @part = FactoryBot.build(:part)
  end

  describe '部品登録' do
    context '部品登録できる場合' do
      it 'part_name,client_id,purchase_price,selling_price,user_idが存在していれば保存できる' do
        expect(@part).to be_valid
      end
    end
    
    context '部品登録できない場合' do
      it 'part_nameが空では保存できない' do
        @part.part_name = ''
        @part.valid?
        expect(@part.errors.full_messages).to include("Part name can't be blank")
      end
      it 'client_idが空では保存できない' do
        @part.client = nil
        @part.valid?
        expect(@part.errors.full_messages).to include("Client must exist")
      end
      it 'purchase_priceが空では保存できない' do
        @part.purchase_price = ''
        @part.valid?
        expect(@part.errors.full_messages).to include("Purchase price can't be blank")
      end
      it 'selling_priceが空では保存できない' do
        @part.selling_price = ''
        @part.valid?
        expect(@part.errors.full_messages).to include("Selling price can't be blank")
      end
      it 'purchase_priceが正の少数では保存できない' do
        @part.purchase_price = Faker::Number.between(from: 1.0, to: 9999999.0)
        @part.valid?
        expect(@part.errors.full_messages).to include("Purchase price must be an integer")
      end
      it 'purchase_priceが0以下では保存できない' do
        @part.purchase_price = -1
        @part.valid?
        expect(@part.errors.full_messages).to include("Purchase price is invalid")
      end
      it 'selling_priceが正の少数では保存できない' do
        @part.selling_price = Faker::Number.between(from: 1.0, to: 9999999.0)
        @part.valid?
        expect(@part.errors.full_messages).to include("Selling price must be an integer")
      end
      it 'selling_priceが0以下では保存できない' do
        @part.selling_price = -1
        @part.valid?
        expect(@part.errors.full_messages).to include("Selling price is invalid")
      end
      it 'userが紐付いていないと保存できない' do
        @part.user = nil
        @part.valid?
        expect(@part.errors.full_messages).to include('User must exist')
      end
    end
  end
end
