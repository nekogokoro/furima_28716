FactoryBot.define do
  factory :user do
    nickname              { 'abe' }
    email                 { 'kkk@gmail.com' }
    password              { '1234qwer' }
    password_confirmation { '1234qwer' }
    first_name            { '漢字' }
    last_name             { '漢字' }
    first_name_kana       { 'カタカナ' }
    last_name_kana        { 'カタカナ' }
    birthday              { '1998','9', '14' }
  end
end