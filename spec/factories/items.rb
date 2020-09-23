FactoryBot.define do
  factory :item do
    association :user
    category_id              { 3 }
    condition_id             { 3 }
    price                 { 1111 }
    name                  { 'は' }
    text                  { 'は' }
    shipping_days_id { 3 }
    postage_id { 1111 }
    prefecture_id { 3 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
