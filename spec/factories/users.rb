FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'伊藤'}
    first_name            {'一男'}
    last_name_kana        {'イトウ'}
    first_name_kana       {'カズオ'}
    birthday              {'1930-01-01'}
  end
end