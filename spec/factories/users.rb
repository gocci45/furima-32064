FactoryBot.define do
  factory :user do
    transient do
      person {Gimei.name}
    end
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password_confirmation { password }
    family_name { person.first.kanji }
    first_name { person.last.kanji }
    family_katakana { person.first.katakana }
    first_katakana { person.last.katakana }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}
  end
end
