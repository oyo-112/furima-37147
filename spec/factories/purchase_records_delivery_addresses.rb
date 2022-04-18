FactoryBot.define do
  factory :purchase_records_delivery_addresses do
    postal_code { '123-4567' }
    prefecture_id { "2" }
    city { "札幌市" }
    address { '1-1' }
    building_name { '札幌ハイツ203'}
    phone_number { '09012345678' }
    token {"tok_abcde12345"}
  end
end
