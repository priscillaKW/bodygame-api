FactoryGirl.define do
  factory :study, class: Study do
    content     Faker::Lorem.sentence
    content_url Faker::Internet.url
  end
end
