FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000000'}
    password_confirmation {password}
    family_name           {'山田'}
    family_name_kana      {'ヤマダ'}
    given_name            {'隆太郎'}
    given_name_kana       {'リクタロウ'}
    birthday              {'1930-01-01'}
  end
end