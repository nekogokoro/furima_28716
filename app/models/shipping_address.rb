class ShippingAddress < ApplicationRecord
  belongs_to :purchase, optional: true

  with_options presence: true do
    validates :postal_code, format: { with: /[-]/ }
    validates :prefecture
    validates :city
    validates :house_number
    validates :tel, format: { with: /\A\d{11}\z/ }
    validates :item_id
 end
end
