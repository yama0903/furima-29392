FactoryBot.define do

  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password              { password }
    password_confirmation { password }
    family_name           { '山﨑' }
    first_name            { '智法' }
    kana_family_name      { 'ヤマザキ' }
    kana_first_name       { 'トモノリ' }
    birthday              { Faker::Date.birthday }
  end
end
