# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :p_image do
  image    File.open("#{Rails.root}/public/images/no_image.jpg")
  end
end
