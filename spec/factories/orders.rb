FactoryBot.define do
  factory :purchase_information_delivery do
    token                 {"tok_abcdefghijk00000000000000000"}
    postal_code           {'000-0000'}
    shipping_area_id      {2}
    municipalities        {'横浜市緑区'}
    address               {'青山３丁目2-2'}
    building              {'伊藤ビル404'}
    tel                   {'09012341234'}


  end
end
