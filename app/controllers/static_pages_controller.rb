class StaticPagesController < ApplicationController
	before_action :authenticate_user!

  def home
  	@post = current_user.posts.build
  end
  
end
