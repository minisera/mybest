FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials }
    profile               { Faker::Lorem.sentence }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    after(:build) do |user|
      user.profile_image.attach(io: File.open('spec/fixtures/test_user.png'), filename: 'test_user.png', content_type: 'image/png')
    end
  end
end
