# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    # nickname               "まいやん"
    email                  "maiyan@email.com"
    password               "00001000"
    # password_confirmation  "00001000"
    # first_name             "白石"
    # last_name              "麻衣"
    # last_name_kana         "シライシ"
    # first_name_kana        "マイ"
  end
end
