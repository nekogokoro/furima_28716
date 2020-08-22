# require 'rails_helper'
# describe Article do
#   describe '#create' do
#     before do
#       @article = build(:item)
#       @article2 = build(:item)
#       @article.image = fixture_file_upload('public/images/test_image.png')
#     end

#     it '全て登録すればしっかりと保存できる事を確認' do
#       expect(@article).to be_valid
#     end

#     it '画像を登録しなかった場合に保存できない事を確認' do
#       @item2.valid?
#       expect(@article2.errors[:image]).to include("can't be blank")
#     end

#     it '300円以下だと登録できない事を確認' do
#       @article.price = 200
#       @article.valid?
#       expect(@article.errors[:price]).to include('must be greater than 299')
#     end

#     it '1000万円以上だと登録できない事を確認' do
#       @article.price = 10_000_000
#       @article.valid?
#       expect(@article.errors[:price]).to include('must be less than 10000000')
#     end

#     it '数値じゃないと登録できない事を確認' do
#       @article.price = '５６７８９'
#       @article.valid?
#       expect(@article.errors[:price]).to include('is not a number')
#     end

#     it '商品名が無いと登録できない事を確認' do
#       @article.title = ''
#       @article.valid?
#       expect(@article.errors[:title]).to include("can't be blank")
#     end

#     it '説明文が無いと登録できない事を確認' do
#       @article.text = ''
#       @article.valid?
#       expect(@article.errors[:text]).to include("can't be blank")
#     end

#     it '値段が無いと登録できない事を確認' do
#       @article.price = ''
#       @article.valid?
#       expect(@article.errors[:price]).to include("can't be blank")
#     end

#     it 'カテゴリーが無いと登録できない事を確認' do
#       @article.category_id = ''
#       @article.valid?
#       expect(@article.errors[:category_id]).to include("can't be blank")
#     end

#     it '商品の状態が無いと登録できない事を確認' do
#       @article.status_id = ''
#       @article.valid?
#       expect(@article.errors[:status_id]).to include("can't be blank")
#     end

#     it '送料の負担者が無いと登録できない事を確認' do
#       @article.shipping_chrge_id = ''
#       @article.valid?
#       expect(@article.errors[:shipping_chrge_id]).to include("can't be blank")
#     end

    it '発送元の地域が無いと登録できない事を確認' do
      @article.shipping_region_id = ''
      @article.valid?
      expect(@article.errors[:shipping_region_id]).to include("can't be blank")
    end

    it '発送までの日数が無いと登録できない事を確認' do
      @article.day_until_shipping_id = ''
      @article.valid?
      expect(@article.errors[:day_until_shipping_id]).to include("can't be blank")
    end

    it "category_id1NG" do
      @article.category_id = 1 
      @article.valid?
      expect(@article.errors[:category_id]).to include("must be other than 1")
    end

    it "status_id1NG" do
      @article.condition_id = 1 
      @article.valid?
      expect(@article.errors[:status_id]).to include("must be other than 1")
    end

    it "shipping_charge_id1NG" do
      @article.carriage_id = 1 
      @article.valid?
      expect(@article.errors[:shipping_charge_id]).to include("must be other than 1")
    end

    it "shipping_region_id1NG" do
      @article.area_id = 1 
      @article.valid?
      expect(@article.errors[:shipping_region_id]).to include("must be other than 1")
    end

    it "day_until_shipping_id1NG" do
      @article.duration_id = 1 
      @article.valid?
      expect(@article.errors[:day_until_shipping_id]).to include("must be other than 1")
    end
  end
end