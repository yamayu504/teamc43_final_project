# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category, class: Category do
    name               "レディース"
    parent_id          0
  end
end
