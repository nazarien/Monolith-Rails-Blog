FactoryBot.define do
  factory :user do
    email {'name@gmail.com'}
    password {'123456'}
    password_confirmation {'123456'}
    id {'1'}
  end

  factory :article do
    title {"exsample title"}
    text {"exsample text"}
  end
end