class FriendshipsController < ApplicationController

	def create
		@friendship = current_user.friendships.build(friend_id: params[:friend_id])
		if @friendship.save
			flash[:success] = "success"
		else
			flash[:danger] = "error"
		end
		redirect_to users_path
	end

	def update
		@friendship = Friendship.find(params[:id])
		if @friendship.update_attributes(accepted: true)
			flash[:success] = "success"
		else
			flash[:danger] = "error"
		end
		redirect_to users_path
	end

	def destroy
		@friendship = Friendship.find(params[:id])
		if @friendship.destroy
			flash[:success] = "success"
		else
			flash[:danger] = "error"
		end			
		redirect_to users_path
	end

end
