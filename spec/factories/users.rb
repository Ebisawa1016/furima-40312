FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    last_name_kanji       { Faker::Name.last_name }
    first_name_kanji      { Faker::Name.first_name }
    last_name_katakana    { 'ヤマダ' }  # 独自のメソッドを用いるなどして、ランダムでかつカタカナの名前を生成してください
    first_name_katakana   { 'タロウ' }  # 同上
    date_birth            { Faker::Date.birthday } 
    email                 { Faker::Internet.free_email }
    encrypted_password    { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end
