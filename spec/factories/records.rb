FactoryBot.define do
  factory :record do
    name { Faker::Movies::HitchhikersGuideToTheGalaxy.character }
    description { Faker::Movies::HitchhikersGuideToTheGalaxy.quote }
    value { Random.new.rand(0.0..9.9) }
  end
end
