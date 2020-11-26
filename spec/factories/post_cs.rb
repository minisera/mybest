FactoryBot.define do
  factory :post_c do
    title         { Faker::Name.initials(10) }
    place         { Faker::Lorem.sentence }
    brand         { Faker::Lorem.sentence }
    story         { 'ああああああああああああああああああああああああああああああ' }
    evidence      { 'ああああああああああああああああああああああああああああああ' }
    after(:build) do |post|
      post.image.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
    association :user
  end
end
