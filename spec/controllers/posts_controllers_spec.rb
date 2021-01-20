require 'spec_helper'
RSpec.describe PostsController, type: :controller do
  	# describe "GET show" do  
	  #   context 'when user is logged in' do
	  #     with :user
	  #     before do
	  #       sign_in user
	  #       get :show
	  #     end
	  #     it { is_expected.to render_template :index }
	  #   end
  	# end

  describe "GET #index" do
  it "populates an array of posts" do
    post = Factory(:post)
    get :index
    assigns(:posts).should eq([post])
  end
end
