class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :day_until_shipping

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :title
    validates :text
    validates :category_id,             numericality: { other_than: 1, message: 'Select' }
    validates :shipping_charge_id,         numericality: { other_than: 1, message: 'Select' }
    validates :status_id,  numericality: { other_than: 1, message: 'Select' }
    validates :shipping_region_id,           numericality: { other_than: 1, message: 'Select' }
    validates :day_until_shipping_id,   numericality: { other_than: 1, message: 'Select' }
  end

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end

  validates :price, presence: true, numericality:
  { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end

