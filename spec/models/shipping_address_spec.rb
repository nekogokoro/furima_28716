# require 'rails_helper'

# RSpec.describe ShippingAddress, type: :model do
#   describe '#create' do
#     before do 
#       @buyer = FactoryBot.build(:shipping_address)
#       @seller = FactoryBot.build(:shipping_address)
     
#     end
    
#     it '全て登録すればしっかり保存できることを確認' do
#       expect(@buyer).to be_valid
#     end

#     it 'ポストコード空NG' do
#       @buyer.postal_code = ''
#       @buyer.valid?
#       expect(@buyer.errors[:postal_code]).to include("can't be blank")
#     end

#     it '都道府県空NG' do
#       @buyer.prefecture = ''
#       @buyer.valid?
#       expect(@buyer.errors[:prefecture]).to include("can't be blank")
#     end
    
#     it '市町くそんNG' do
#       @buyer.city = ''
#       @buyer.valid?
#       expect(@buyer.errors[:city]).to include("can't be blank")
#     end

#     it '番地空NG' do
#       @buyer.house_number = ''
#       @buyer.valid?
#       expect(@buyer.errors[:house_number]).to include("can't be blank")
#     end
    
#     it '電話番号空NG' do
#       @buyer.tel = ''
#       @buyer.valid?
#       expect(@buyer.errors[:tel]).to include("can't be blank")
#     end

    

#     it '電話番号ハイフンNG' do
#       @buyer.tel = '000-000-000'
     
#       @buyer.valid?
#       expect(@buyer.errors[:tel]).to include("is invalid")
#     end

#     it '電話番号１１桁0K' do
#       @buyer.tel = '11111111111'
#       expect(@buyer).to be_valid
#     end

#     it 'ポストコードハイフン無しNG' do
#       @buyer.postal_code = '1234567' 
#       @buyer.valid?
#       expect(@buyer.errors[:postal_code]).to include("is invalid")
#     end
#   end
# end
