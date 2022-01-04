FactoryBot.define do
  factory :order_address do
    post_number        {'123-4567'}
    shipping_area_id   { '2' }
    city_town_village  {'日本市'}
    address_number    {'沖縄123'}
    buliding_name {'任意'}
    tel_number {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
