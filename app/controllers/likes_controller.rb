class LikesController < ApplicationController
  before_action :require_user_logged_in

#いいね
  def create
    @like = current_user.likes.create(record_id: params[:record_id])
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

#いいねを外す
  def destroy
    like = current_user.likes.find_by(record_id: params[:record_id])
    like.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  private
end
