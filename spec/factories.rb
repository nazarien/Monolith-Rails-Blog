FactoryBot.define do
    # factory :user do
      # email {'name1321312@gmail.com'}
      # password {'123456'}
      # password_confirmation {'123456'}
      # id {'1'}
    # end

    factory :article do
      title {"exsampldsfae1 title"}
      text {"exsampfsdale text"}
      id { 1 }
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
      id {'1'}

      trait :with_articles do
        after :create do |user|
          articles = FactoryBot.create_list :article, 2
  
          user.articles << articles
          user.save
        end
      end
    end
end