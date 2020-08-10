class LikesController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_record

#いいね
  def create
    @like = current_user.likes.create(record_id: params[:record_id])
    @record.reload
  end

#いいねを外す
  def destroy
    like = current_user.likes.find_by(record_id: params[:record_id], user_id: current_user.id)
    like.destroy
    @record.reload
  end

  private

  def set_record
    @record = Record.find(params[:record_id])
  end
end
