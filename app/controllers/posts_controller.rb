class PostsController < ApplicationController
	before_action :authenticate_user!

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			redirect_to root_url
		else
			render 'static_pages/home'
		end
	end

	def index
		@post = current_user.posts.build
		@posts = []
		Post.all.reverse.each do |p|
			@posts << p if p.user == current_user || current_user.friend?(p.user)
		end
	end

	def destroy
	end

	private
		def post_params
			params.require(:post).permit(:content)
		end

end
