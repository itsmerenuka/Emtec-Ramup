class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:author, :content))
		redirect_to post_path(@post)
	end

	def edit
  		@comment = Comment.find(params[:id])
  		@post = Post.find(params[:post_id])
	end

	def update
		@post = Post.find(params[:post_id])
	    @comment = Comment.find(params[:id])
	    @comment.update_attributes(params[:comment])
		redirect_to @post
	end

	def destroy
		@comment = Comment.find(params[:id])
   		@comment.destroy
	   respond_to do |format|
	     format.html { redirect_to posts_url }
	     format.json { head :no_content }
	  end
	end
end
