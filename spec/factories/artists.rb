FactoryBot.define do
  factory :artist do
    name { Faker::Movies::HitchhikersGuideToTheGalaxy.character }
    profile { Faker::Movies::HitchhikersGuideToTheGalaxy.quote }

    user
  end
end
