FactoryBot.define do
  factory :orders do
    postal_code           {000-0000}
    shipping_area_id      {2}
    municipalities        {'横浜市緑区'}
    address               {'青山３丁目2-2'}
    building              {'伊藤ビル404'}
    tel                   {12345678912}
    
    association :user_id
    association :item_id
  end
end
