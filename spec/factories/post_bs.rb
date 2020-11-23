FactoryBot.define do
  factory :post_b do
    title         { Faker::Name.initials }
    place         { Faker::Lorem.sentence }
    brand         { Faker::Lorem.sentence }
    story         { 'ああああああああああああああああああああああああああああああ' }
    evidence      { 'ああああああああああああああああああああああああああああああ' }
    association :user
  end
end
