FactoryBot.define do
  factory :user do
    transient do
      person {Gimei.name}
    end

    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {person.last.kanji}
    family_name_kana      {person.last.katakana}
    given_name            {person.first.kanji}
    given_name_kana       {person.first.katakana}
    birthday              {Faker::Date.between(from: '1930-01-01', to: '2017-12-31')}
  end
end