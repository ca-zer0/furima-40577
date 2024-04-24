FactoryBot.define do
  factory :item do
    
    name {'test'}
    describe {'testtest'}
    price {999}
    association :user
    category_id {3}
    condition_id {2}
    deli_charge_id {3}
    prefecture_id {13}
    deli_time_id {4}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
end
