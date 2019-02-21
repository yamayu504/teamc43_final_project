
FactoryGirl.define do
  factory :product, class: Product do
    name                 "ナイスなコーヒー"
    description          "スタバのコーヒー"
    size                 1
    condition            1
    select_shipping_fee  1
    shipping_method      1
    area                 1
    shipping_date        1
    price                11111
    category_id          1
    brand_id             1
    for_sale             1
    deal                 0
    seller_id            1
    buyer_id             nil
    association :seller, factory: :user, strategy: :build
    association :category, factory: :category
  end
end
