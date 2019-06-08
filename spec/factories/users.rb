FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}

    after(:build) { |u| u.password_confirmation = u.password = 'passwd' }
  end

   factory :other_user, class: User do
    email {Faker::Internet.email}

    after(:build) { |u| u.password_confirmation = u.password = 'passwd' }
  end
end
