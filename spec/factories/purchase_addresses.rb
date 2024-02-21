FactoryBot.define do
  factory :purchase_address do
    postal_code         { "121-0012"}
    prefecture_id       { 3 }
    city                { "足立区" }
    street_address      { "4-1-2" }
    building_name       { "グランブルー青井" }
    phone_number        { "09067904310" }
    token {"tok_abcdefghijk00000000000000000"}
     end
end
