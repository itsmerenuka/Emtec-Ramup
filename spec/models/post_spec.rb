require 'rails_helper'
RSpec.describe Post, :type => :model do
 	
 	# subject {Post.new(:author => "ABC", :subject => "Test case", content: => "Hellllooooo")}
 	subject {
    Post.new(           author: "Anything",
                        subject: "Lorem ipsum",
                        content: "hsgdhagshdgashgdhasg",
                        category_id: 1)
  }

 	it "is not valid without a author" do
    	subject.author = nil
    	expect(subject).to_not be_valid
  	end

  	it "subject should not be too long" do
  		subject.subject = 'a' * 30
  		expect(subject).to_not be_valid
  	end

  	it "should have many comments" do
    	t = Post.reflect_on_association(:comments)
    	expect(t.macro).to eq(:has_many)
  	end

  	it "has a valid factory" do
    	FactoryBot.create(:post).should be_valid
  	end
end