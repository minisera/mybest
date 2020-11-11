FactoryBot.define do
  factory :post_g do
    title         {Faker::Name.initials}
    place         {Faker::Lorem.sentence}
    brand         {Faker::Lorem.sentence}
    story         {"ああああああああああああああああああああああああああああああ"}
    evidence      {"ああああああああああああああああああああああああああああああ"}
    association :user
  end
end
