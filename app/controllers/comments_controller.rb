class CommentsController < ApplicationController

	def create
		@comment = current_user.posts.build(post_id: params[:post_id], content: params[:content])
		@comment.save
		redirect_to root_url
	end

	def destroy
	end

end
