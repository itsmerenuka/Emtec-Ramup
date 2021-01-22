FactoryBot.define do
  factory :post do 
  	association :category, factory: :category
  	association :user, factory: :user
    author { "Joe" }
   	subject {"Factory"}
    content {"For factory"}
  end
end
