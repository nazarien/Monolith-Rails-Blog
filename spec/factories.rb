FactoryBot.define do
  factory :comment do
    commenter { "MyString" }
    body { "MyText" }
    article { nil }
  end

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