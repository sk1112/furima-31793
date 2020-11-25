FactoryBot.define do
  factory :user_purchase_record do
    postal_code         { "163-0023" }
    prefecture_id       { 14 }
    city                { "新宿区" }
    detailed_address    { "2-8-1" }
    apartment           { "東京都庁第二本庁舎" }
    phone_number        { "0353211111" }
    purchase_record_id  { 1 }
    token               { "tok_1a2b3c4d5e6f7g8h9i" }
  end
end
