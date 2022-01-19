FactoryBot.define do
  factory :user_order do
    post_code     { '123-4567' }
    prefecture_id { 3 }
    city          { '横浜市' }
    address       { '緑区' }
    building_name { '横浜ビル' }
    phone_number  { '09012345678' }
    token         { 123 }
  end
end