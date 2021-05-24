FactoryBot.define do
  factory :item do
    product_name           {'時計'}
    description            {'日本製'}
    category_id            {2}
    status_id              {2}
    shipping_charge_id     {2}
    shipping_area_id       {2}
    shipping_day_id        {2}
    price                  {1000}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
