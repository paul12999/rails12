class CommentsController < ApplicationController
	before_action :authenticate_user!
	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.create(params[:comment].permit(:content))
		@comment.user_id = current_user.id
		@comment.post_id = @post.id

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy

		redirect_to post_path(@post)
	end
 
		if @comment.save
			redirect_to post_path(@post)
		else
			render 'new'
		end
	end
end
