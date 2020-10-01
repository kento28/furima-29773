FactoryBot.define do
  factory :order_address do
        postal { '123-4567' }
        prefecture_id { 1 }
        city              { '東京' }
        address1          { '東京' }
        address2          { '東' }
        telephone         { 12345678912 }
        token             { 'tok_hogehoge1234' }
        association       :item
        association       :user
  end
end
