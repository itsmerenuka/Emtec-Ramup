class PostsController < ApplicationController
	before_action :authenticate_user!,  except: [:index]
	def index
		@posts =Post.all.order("created_at DESC")
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)

		if @post.save
			redirect_to @post
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
    		flash[:success] = "Task updated!"
    		redirect_to post_path(@post)
  		else
    	render action: :edit
  		end
	end

	def show
		@post = Post.find(params[:id])
		@comments = @post.get_comments
	end
	# def show
	# 	p params
 #  		@post = Post.find(params[:id])
 #  		@comment = @post.comments.build
	# end

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
		@post = Post.find(params[:id])
   		@post.destroy
	   respond_to do |format|
	     format.html { redirect_to posts_url }
	     format.json { head :no_content }
	  end
	end

	private

	def post_params
		params.require(:post).permit(:author, :subject, :content, :category_id)
	end

end
