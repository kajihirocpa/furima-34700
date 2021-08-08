FactoryBot.define do
gimei = Gimei.name

  factory :user do
    name                  {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {gimei.first.kanji}
    family_name           {gimei.last.kanji}
    read_first            {gimei.first.katakana}
    read_family           {gimei.last.katakana}
    birth_day             {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end