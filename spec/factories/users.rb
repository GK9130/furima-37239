FactoryBot.define do
  factory :user do
    nickname              { 'ネコ' }
    email                 { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) + 'a1' }
    password_confirmation { password }
    family_name           { '夏目' }
    first_name            { '漱石' }
    family_name_kana      { 'ナツメ' }
    first_name_kana       { 'ソウセキ' }
    birthday              { Faker::Date.birthday }
  end
end