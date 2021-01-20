FactoryBot.define do
  factory :post do 
  	association :category, factory: :category
    author { "Joe" }
   	subject {"Factory"}
    content {"For factory"}
  end
end
