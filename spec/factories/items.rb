FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    text {Faker::Lorem.sentence}
    price {Faker::Number.within(range: 300..9999999)}
    cost_id {Faker::Number.within(range: 2..3)}
    category_id {Faker::Number.within(range: 2..11)}
    shipping_address_id {Faker::Number.within(range: 2..48)}
    status_id {Faker::Number.within(range: 2..6)}
    shipping_day_id {Faker::Number.within(range: 2..4)}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
