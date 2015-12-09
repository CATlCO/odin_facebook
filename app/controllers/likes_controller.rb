class LikesController < ApplicationController

	def create
		@like = Like.new(user_id: params[:user_id], post_id: params[:post_id])
		if @like.save
			flash[:success] = "success"
		else
			flash[:danger] = "error"
		end
		redirect_to root_path
	end

	def destroy
		@like = Like.find(params[:id])
		if @like.destroy
			flash[:success] = "success"
		else
			flash[:danger] = "error"
		end
		redirect_to root_path
	end

end
