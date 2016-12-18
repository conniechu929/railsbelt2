class LikesController < ApplicationController
  def index
  end

  def create
    @adds = Like.find_by_user_id_and_post_id(session[:user_id],params[:post_id])
		if @adds
			@adds.increment!(:like_count)
			# @adds.save()
      redirect_to request.referer
		else
			@adds = Like.create(user_id:session[:user_id], post_id:params[:post_id],like_count:1)
      redirect_to request.referer
		end
  end
end
