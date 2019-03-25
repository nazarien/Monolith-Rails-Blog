FactoryBot.define do
    factory :article do
      title {"exsampldsfae1 title"}
      text {"exsampfsdale text"}
    end    

    factory :comment do
      commenter { "MyString" }
      body { "MyText" }
      
      trait :for_user do
        association(:commentable, factory: :user)
      end
  
      trait :for_article do
        association(:commentable, factory: :article)
      end
    end

    factory :user do
      email {'name1321312@gmail.com'}
      password {'123456'}
      password_confirmation {'123456'}
      role { 'author' }

      trait :with_articles do
        after :create do |user|
          articles = FactoryBot.create_list :article, 2
  
          user.articles << articles
          user.save
        end
      end
    end
end