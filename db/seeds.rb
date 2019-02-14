require 'csv'

unless User.exists?
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
end

unless Brand.exists?
  CSV.foreach('db/csv/brands.csv') do |row|
    Brand.create(id: row[0], name: row[1], group_name: row[2], name_initial: row[3])
  end
end
unless Category.exists?
  CSV.foreach('db/csv/categories.csv') do |row|
    Category.create(id: row[0], name: row[1], parent_id: row[2], name_initial: row[3],created_at: row[4],updated_at:[5])
  end
end
unless Size.exists?
  CSV.foreach('db/csv/sizes.csv') do |row|
    Size.create(id: row[0], size: row[1], created_at: row[2],updated_at:[3])
  end
end
