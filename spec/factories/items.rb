FactoryBot.define do
  factory :item do
    name            { '商品名' }
    description     { '商品説明'  }
    price           { 1000 }
    category_id     { 2 }
    condition_id    { 2 }
    postage_id      { 2 }
    prefecture_id   { 2 }
    shipping_id     { 2 }

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
