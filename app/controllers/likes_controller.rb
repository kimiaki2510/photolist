class LikesController < ApplicationController
  before_action :require_user_logged_in

  def create
    @like = current_user.likes.create(record_id: params[:record_id])
    redirect_to root_path
    #respond_to do |format|
      #format.html { redirect_to root_path }
      #format.js {render :action => "index"}
    #end
  end

  def destroy
    @like = Like.find_by(id: params[:id]).destroy
    @like.destroy
    redirect_to root_path
    #respond_to do |format|
      #format.html { redirect_to root_path }
      #format.js {render :action => "index"}
    #end
  end
end
