class CommentsController < ApplicationController
	before_action :authenticate_user!, only: [:create]
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:body))
		redirect_to post_path(@post)
	end
end
