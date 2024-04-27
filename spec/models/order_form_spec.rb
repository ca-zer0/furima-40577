require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user: user)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '購入できる場合' do
     it '必須項目が全てあれば購入できること' do
       expect(@order_form).to be_valid
     end
     it '建物名が空でも購入できること' do
      @order_form.building = ''
      expect(@order_form).to be_valid
     end
  end
  
  context '登録できない場合' do
    it 'post_codeがない場合は登録できないこと' do
     @order_form.post_code = ''
     @order_form.valid?
     expect(@order_form.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeは『３桁ハイフン４桁』半角英数字でないと保存できないこと' do
      @order_form.post_code = '123-123４'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it 'prefectureに「---」が選択されている場合は購入できないこと' do
      @order_form.prefecture_id = '1'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと購入できないこと' do
      @order_form.city = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("City can't be blank")
    end
    it 'streetが空だと購入できないこと' do
      @order_form.street = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Street can't be blank")
    end
    it 'phone_numberが空だと購入できないこと' do
      @order_form.phone_number = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが9桁以下だと購入できないこと' do
      @order_form.phone_number = '090123456'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号が12桁以上だと購入できない' do
      @order_form.phone_number = '090123456789'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberが半角数値でないと購入できないこと' do
      @order_form.phone_number = '０9012341234'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number is invalid")
    end
    it 'tokenが空では購入できないこと' do
      @order_form.token = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Token can't be blank")
    end
    it 'user_idが紐づいていなければ購入できないこと' do
      @order_form.user_id = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが紐づいていなければ購入できないこと' do
      @order_form.item_id = ''
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Item can't be blank")
    end
  end
  end
  end