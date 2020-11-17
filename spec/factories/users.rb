FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.last_name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { '鈴木' }
    first_name            { '功成' }
    family_name_kana      { 'スズキ' }
    first_name_kana       { 'コウセイ' }
    birthday              { Faker::Date.between(from: '1980-01-01', to: '2020-10-31') }
  end
end
