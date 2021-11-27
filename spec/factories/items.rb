FactoryBot.define do
  factory :item do
    item_name              {'アイウエオ'}
    item_info            {'アイウエオ'}
    item_category_id             {'2'}
    item_status_id       {'2'}
    item_delivery_free_id        {'2'}
    shipping_area_id              {'2'}
    days_to_ship_id                 {'2'}
    price              {'300'}

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end