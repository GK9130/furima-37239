FactoryBot.define do
  factory :user_order do
    user_id      {}
    item_id      {}
    post_code  { '123-4567' }
    prefecture  { 2 }
    city         { '横浜市' }
    address { '北横浜' }
    building_name { '横浜ビル' }
    phone_number { '09012345678' }

    association :user
    association :item
  end
end