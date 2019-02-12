# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(
  nickname: 'まいやん',
  email: "maiyan@email.com",
  password: '00001000',
  password_confirmation: '00001000',
  first_name: '白石',
  last_name: '麻衣',
  last_name_kana: 'シライシ',
  first_name_kana: 'マイ',
  phone_number: '09011113333',
  postal_code: '1234567',
  prefecture: '0',
  cities: '千代田区',
  address: '新町',
  building_name: '乃木坂ビル46階',
  birthday: '19920820',
  profile: '四次元から来ましたマヨラー星人、19歳、まいやんこと、白石麻衣です'
  )
user.save!
