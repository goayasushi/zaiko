require 'rails_helper'

RSpec.describe Client, type: :model do
  describe '仕入登録情報の保存' do
    before do
      @client = FactoryBot.build(:client)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@client).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @client.building = ''
        expect(@client).to be_valid
      end
      it 'picは空でも保存できること' do
        @client.pic = ''
        expect(@client).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postcodeが空だと保存できないこと' do
        @client.client_name = ''
        @client.valid?
        expect(@client.errors.full_messages).to include("Client name can't be blank")
      end
      it 'postcodeが空だと保存できないこと' do
        @client.postcode = ''
        @client.valid?
        expect(@client.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @client.postcode = '1234567'
        @client.valid?
        expect(@client.errors.full_messages).to include('Postcode is invalid')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @client.prefecture_id = 1
        @client.valid?
        expect(@client.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityが空だと保存できないこと' do
        @client.city = ''
        @client.valid?
        expect(@client.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと保存できないこと' do
        @client.block = ''
        @client.valid?
        expect(@client.errors.full_messages).to include("Block can't be blank")
      end
      it 'phoneが空だと保存できないこと' do
        @client.phone = ''
        @client.valid?
        expect(@client.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが半角のハイフンを含んだ形式では保存できないこと' do
        @client.phone = '111-1111-1111'
        @client.valid?
        expect(@client.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneが全角数字だと保存できないこと' do
        @client.phone = '１１１１１１１１１１１'
        @client.valid?
        expect(@client.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneが9桁以下だと保存できないこと' do
        @client.phone = '111111111'
        @client.valid?
        expect(@client.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneが12桁以上だと保存できないこと' do
        @client.phone = '111111111111'
        @client.valid?
        expect(@client.errors.full_messages).to include('Phone is invalid')
      end
      it 'userが紐付いていないと保存できないこと' do
        @client.user = nil
        @client.valid?
        expect(@client.errors.full_messages).to include("User must exist")
      end
    end
  end


end
