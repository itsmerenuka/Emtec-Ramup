class PostsController < ApplicationController
	before_action :authenticate_user!,  except: [:index]
	def index
		@posts =Post.all.order("created_at DESC")
		render 'index'
	end

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.create(post_params)
		puts "Hello"
		puts @post.class
		if @post.save
			redirect_to @post
			# flash[:success] = "Post Created!"
		else
			render 'new'
		end
	end

	def edit
		 @post = Post.find(params[:id])
	end

	def update
  		@post = Post.find(params[:id])
  		if @post.update!(post_params)
    		flash[:success] = "Post updated!"
    		redirect_to post_path(@post)
  		else
    	render action: :edit
  		end
	end

	def show
		puts "Hi this is show method"
		puts params[:id]
		@post = Post.find(params[:id])
		@comments = @post.get_comments
	end
	

	def sorted_data
		@category = Category.find(params[:category_id])
		@posts = @category.get_category_posts
		if @posts.present?
			respond_to do |format|
	     		format.html { render :sorted_data}
	   		end 
	   	 else
	   	 	flash[:alert] = "There is no any posts related to this category."

	   	end
	end

	def destroy
		puts "wertyuiertyu"
		@post = Post.find(params[:id])
   		if @post.destroy
	  #  respond_to do |format|
	  #    format.html { redirect_to posts_url }
	  #    format.json { head :no_content }
	  # end
	  		redirect_to posts_path
	  	else
	  		flash[:errors] = "Post doesn't exist"
	  	end
	end

	private

	def post_params
		params.require(:post).permit(:author, :subject, :content, :category_id)
	end

end
