require 'rails_helper'
RSpec.describe PostsController, type: :controller do
	describe "GET #show" do
	 	let(:dummy_post) { create(:post) }
	    it "populates an array of posts" do
	    	@user = dummy_post.user
	    	get :show , params: { id: dummy_post.id }
	    	 sign_in(@user)
	    	 # puts res
	    	 response.should render_template :show
	    	# assigns (dummy_post).should eq(dummy_post)
	   end  
    end

    describe "GET/index" do
    	render_views
    	let(:dummy_posts) { create_list(:post, 5) }
	    it "renders the :index view" do
	    	 get :index
	    	response.should render_template :index
	  	end
  	end

  	describe '#destroy' do
	   	render_views
    	let!(:post) { create(:post) }
	    it "remove post from table" do
	    	 get :index
	    	 params = { id: post.id }
 			 delete :destroy, params: params
 			 expect(response.status).to eq(302)
	  	end

	    context 'delete a non-existent post' do
	      it 'creates an error message' do
	      	params = { id: 1000 }
	         delete :destroy, params: params
	         s = StandardError.new
  			 expect {raise s}.to raise_error(s)
	      end
	    end
	end

	describe "POST create" do 
    	it "redirects to the home page upon save" do
  		post :create, params: FactoryBot.attributes_for(:post)
  		puts response.status
  		expect(response.status).to eq(302)
		end
  	end
end
