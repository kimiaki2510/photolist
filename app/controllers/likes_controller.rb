class LikesController < ApplicationController
  before_action :require_user_logged_in

#いいね
  def create
    #byebug
    @like = current_user.likes.create(record_id: params[:record_id])
    redirect_to root_path
    #respond_to do |format|
      #format.html { redirect_to root_path }
      #format.js
    #end
  end

#いいねを外す
  def destroy
    @like = Like.find_by(record_id: params[:record_id], user_id: @current_user.id)
    @like.destroy
    redirect_to root_path
    #respond_to do |format|
      #format.html { redirect_to root_path }
      #format.js
    #end
  end
end
