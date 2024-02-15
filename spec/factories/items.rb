FactoryBot.define do
  factory :item do
    description { "Sample description" }
    price { 1000 }
    item_name { "Sample item" }
    category_id { 3 }
    status_id { 3 }
    shipping_fee_burden_id { 3 }
    prefecture_id { 3 }
    shipping_duration_id { 3 }
    after(:build) do |item|
      item.image.attach(io: File.open('public/sample.jpg'), filename: 'sample.jpg')
    end
  end
end

