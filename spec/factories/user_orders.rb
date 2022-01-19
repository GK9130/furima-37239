FactoryBot.define do
  factory :user_order do
    user_id      {}
    item_id      {}
    post_code  { '123-4567' }
    prefecture  { 1 }
    city         { '横浜市' }
    address { '緑区' }
    building_name { '横浜ビル' }
    phone_number { '09012345678' }
    token { }

    association :user
    association :item
  end
end