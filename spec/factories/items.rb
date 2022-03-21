FactoryBot.define do
  factory :item do
    
    item_name        {'sample'}
    description      {'sample'}
    category_id      {2}
    condition_id     {2}
    shipping_cost_id {2}
    prefecture_id    {2}
    shipping_day_id  {2}
    price            {300}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
