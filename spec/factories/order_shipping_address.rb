FactoryBot.define do
  factory :order_shipping_address do
    postal_code      { '111-1111' }
    prefectures      { '3' }
    city             { '松戸市' }
    address          { '日暮３' }
    building_name    { '山崎ビル' }
    phone            { '09011111111' }
    token            { 'tok_abcdefghijk00000000000000000' }
  end
end
