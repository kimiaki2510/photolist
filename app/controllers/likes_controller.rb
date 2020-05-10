class LikesController < ApplicationController
  before_action :require_user_logged_in

  def create
    @like = Record.find(params[:record_id])
    current_user.fav(record)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    record = Record.find(params[:record_id])
    current_user.unfav(record)
    redirect_back(fallback_location: root_path)
  end
end
