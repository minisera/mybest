FactoryBot.define do
  factory :post_c do
    title         {Faker::Name.initials}
    place         {Faker::Lorem.sentence}
    brand         {Faker::Lorem.sentence}
    story         {Faker::Lorem.sentence}
    evidence      {Faker::Lorem.sentence}
    association :user
  end
end
