require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
    @item = FactoryBot.build(:item)
end

 describe '商品出品機能' do
  context '登録できる場合' do
   it "必須項目が全てあれば登録できること" do
     expect(@item).to be_valid
   end

   it "priceが300ちょうどだと登録できる" do
    @item.price = 300
    expect(@item).to be_valid
    end

    it "priceが9999999だと登録できる" do
      @item.price = 9999999
      expect(@item).to be_valid
    end
  end

   context '登録できない場合' do
   it "nameがない場合は登録できないこと" do
    @item.name = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
   end

   
   it "describeがない場合は登録できないこと" do
    @item.describe = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Describe can't be blank")
   end

   
   it "category_idがない場合は登録できないこと" do
     @item.category_id = ''
     @item.valid?
     expect(@item.errors.full_messages).to include("Category can't be blank")
   end


   it "condition_idがない場合は登録できないこと" do
    @item.condition_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition can't be blank")
  end

   
   it "deli_charge_idがない場合は登録できないこと" do
    @item.deli_charge_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Deli charge can't be blank")
   end

   
   it "prefecture_idがない場合は登録できないこと" do
    @item.prefecture_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture can't be blank")
   end

   
   it "deli_time_idがない場合は登録できないこと" do
    @item.deli_time_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Deli time can't be blank")
   end

   
   it "priceがない場合は登録できないこと" do
    @item.price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
   end


   it "imageがない場合は登録できないこと" do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end

   
   it "priceが299以下だと登録できないこと" do
    @item.price = '100'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
   end

   
   it "priceが10000000以上だと登録できないこと" do
     @item.price = '10000000'
     @item.valid?
     expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
   end


   it "priceが小数値だと登録できない" do
     @item.price = '123.45'
     @item.valid?
     expect(@item.errors.full_messages).to include('Price must be an integer')
  end


  it "priceが全角だと登録できない" do
    @item.price = '３００'
    @item.valid?
    expect(@item.errors.full_messages).to include('Price is not a number')
  end


   it 'category_idが"---"では登録できない' do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
   end

   it 'condition_idが"---"では登録できない' do
    @item.condition_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition can't be blank")
   end

   it 'deli_charge_idが"---"では登録できない' do
    @item.deli_charge_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Deli charge can't be blank")
   end

   it 'prefecture_idが"---"では登録できない' do
    @item.prefecture_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture can't be blank")
   end

   it 'deli_time_idが"---"では登録できない' do
    @item.deli_time_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Deli time can't be blank")
   end


   it 'userが紐づいていない場合は登録できない' do
    @item.user = nil
    @item.valid?
    expect(@item.errors.full_messages).to include('User must exist')
  end
  end
end
end
