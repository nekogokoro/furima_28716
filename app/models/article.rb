class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category ,:shipping_charge,:status,:shipping_region,:day_until_shipping

  #空の投稿を保存できないようにする
  validates :title, :text, :category, :shipping_charge,:status,:shipping_region,:day_until_shipping, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id,:shipping_charge_id,:status_id,:shipping_region_id,:day_until_shipping_id, numericality: { other_than: 1 } 
end
