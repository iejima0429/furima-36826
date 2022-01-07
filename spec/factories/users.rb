FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    first_name            {'山田'}
    last_name             {'太郎'}
    first_name_kana       {'ヤマダ'}
    last_name_kana        {'タロウ'}
    birthday              {'1930-01-01'}
    email                 {Faker::Internet.free_email}
    password              {'abc123'}
    password_confirmation {password}
    
  end
end