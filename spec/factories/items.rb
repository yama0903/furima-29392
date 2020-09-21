FactoryBot.define do
  factory :item do
    name               { Faker::Name.name }
    explanation        { Faker::Lorem.sentence }
    category_id        { '3' }
    status_id          { '3' }
    price              { '1000' }
    delivery_fee_id    { '3' }
    shipping_origin_id { '3' }
    delivery_date_id   { '3' }
    association :user
  end
end
