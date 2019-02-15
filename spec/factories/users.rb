# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    nickname               "まいやん"
    email                  "maiyan@email.com"
    password               "00001000"
    password_confirmation  "00001000"
    first_name             "白石"
    last_name              "麻衣"
    last_name_kana         "シライシ"
    first_name_kana        "マイ"
    phone_number           "09012341234"
    postal_code            "1234567"
    prefecture             0
    cities                 "沼田市"
    address                "新町1801-1"
    building_name          "乃木坂ビル46階"
    birthday               "19920820"
    profile                "四次元から来ましたマヨラー星人、19歳、まいやんこと、白石麻衣です"

  end
end
