FactoryBot.define do
  factory :post do
    title         { 'ああああああああああ' }
    place         { 'ああああああああああ' }
    brand         { 'ああああああああああ' }
    story         { 'ああああああああああああああああああああああああああああああ' }
    evidence      { 'ああああああああああああああああああああああああああああああ' }
    type          { 'Book' }
    after(:build) do |post|
      post.image.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
    association :user
  end
end
