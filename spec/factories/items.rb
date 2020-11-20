FactoryBot.define do
  factory :item do
    name              { 'PlayStation®5' }
    description       { '超高速SSDにより読み込み速度が飛躍的に向上。ハプティック技術、アダプティブトリガー、3Dオーディオ※技術が生み出す濃密な没入感。' }
    price             { 43_978 }
    image             { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/rspec_test.jpg')) }
    category_id       { 6 }
    condition_id      { 2 }
    prefecture_id     { 14 }
    delivery_day_id   { 2 }
    delivery_fee_id   { 3 }
    user_id           { FactoryBot.create(:user).id }
  end
end
