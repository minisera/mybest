FactoryBot.define do
  factory :user do
    name                  {Faker::Name.initials}
    profile               {Faker::Lorem.sentence}
    profile_image         {Faker::Lorem.sentence}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end
