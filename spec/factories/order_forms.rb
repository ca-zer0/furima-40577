FactoryBot.define do
  factory :order_form do
    item_id {1}
    user_id {4}
    post_code {Faker::Number.leading_zero_number(digits: 4)}
    prefecture_id
    city {Faker::Address.city}
    street {Faker::Address.street_address}
    phone_number {Faker::Number.leading_zero_number(digits: 11)}
    token {"tok_abcdefghijk00000000000000000"}
  end
end