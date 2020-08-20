require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  describe '#create' do
    before do 
      @shipping_address = build(:shipping_address)
    end
    
    it '全て登録すればしっかり保存できることを確認' do
      expect(@shipping_address).tp be_valid
    end

    it 'ポストコード空NG' do
      @shipping_address.postal_code = ''
      @shipping_address.valid?
      expect(@shipping_address.errors[:postal_code]).to include("can't be blank")
    end

    it '都道府県空NG' do
      @shipping_address.prefecture = ''
      @shipping_address.valid?
      expect(@shipping_address.errors[:prefecture]).to include("cant be blank")
    end
    
    it '市町くそんNG' do
      @shipping_address.city = ''
      @shipping_address.valid?
      expect(@shipping_address.errors[:city]).to include("cant be blank")
    end

    it '番地空NG' do
      @shipping_address.house_number = ''
      @shipping_address.valid?
      expect(@shipping_address.errors[:house_number]).to include("cant be blank")
    end
    
    it '電話番号空NG' do
      @shipping_address.tel = ''
      @shipping_address.valid?
      expect(@shipping_address.errors[:tel]).to include("cant be blank")
    end

    it '電話番号１２桁NG' do
      @shipping_address = '111111111111'
      @shipping_address.valid?
      expect(@shipping_address[:tel]).to include("cant be blank")
    end

    it '電話番号１１桁0K' do
      @shipping_address.tel = '11111111111'
      expect(@shipping_address).to be_valid
    end

    it 'ハイフン無しNG' do
      @shipping_address.postal_code = '1234567' do
      @shipping_address.valid?
      expect(@shipping_address.errors[:postal_code]).to include("cant be blank")
    end
  end
end
