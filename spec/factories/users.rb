FactoryBot.define do
  factory :user do
    test_user = Gimei.name

    nickname {"test"}
    email {Faker::Internet.email}
    password {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name {test_user.family.kanji}
    family_name_key {test_user.family.katakana}
    first_name {test_user.first.kanji}
    first_name_key {test_user.first.katakana}
    birthday {Faker::Date.backward}
  end
end