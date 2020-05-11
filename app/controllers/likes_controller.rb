class LikesController < ApplicationController
  before_action :require_user_logged_in

  def create
    @like = current_user.likes.build(record_id: params[:record_id])
    @like.save
    redirect_to root_path
    #@like = Record.find(params[:record_id])
    #current_user.fav(record)
    #redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(record_id: params[:record_id], user_id: current_user.id)
    @like.destroy
    redirect_to root_path
    #record = Record.find(params[:record_id])
    #current_user.unfav(record)
    #redirect_back(fallback_location: root_path)
  end
end
