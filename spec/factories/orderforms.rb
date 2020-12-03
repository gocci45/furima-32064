FactoryBot.define do
  factory :orderform do
    transient do
      address {Gimei.address}
    end
    post_number { '123-4567' }
    shipping_address_id {Faker::Number.within(range: 2..48)}
    city { address.city.kanji }
    city_number { address.town.kanji }
    building { "記述自由" }
    tel_number { 11111111111 }
    token {"tok_abcdefghijk00000000000000000"}
  end
end