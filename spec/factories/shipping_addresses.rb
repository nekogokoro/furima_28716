FactoryBot.define do
  factory :shipping_address do
    factory :order_info do
      postal_code      {"111-1111"}
      prefecture       {"1"}
      city             {"東京"}
      house_number     {"1111"}
      building_name    {"丸の内"}
      tel              {"00000000000"}
      
      item_id          {1}
     
    
    end
  end
end
