class LikesController < ApplicationController
  before_action :require_user_logged_in

  def create
    @record = Record.find(params[:record_id])
    @record.fav(current_user)
  end

  def destroy
    @record = Like.find(params[:id]).record
    @record.unfav(current_user)
  end
end
