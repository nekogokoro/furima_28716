FactoryBot.define do
  factory :item do
    title                  { 'test' }
    text           { '説明文がここに入ります。' }
    price                 { '10000' }
    user_id               { '1' }
    status_id          { '2' }
    category_id               { '2' }
    shipping_charge_id             { '2' }
    shipping_region_id        { '2' }
    day_until_shipping_id               { '2' }
  end
end