class LikesController < ApplicationController
  before_action :require_user_logged_in

  def create
    @record = Record.find(params[:record_id])
    unless @record.iine?(current_user)
      @record.iine(current_user)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
    #@like = current_user.likes.create(record_id: params[:record_id])
    #redirect_to root_path
  end

  def destroy
    @record = Like.find(params[:id]).record
    if @record.iine?(current_user)
      @record.uniine(current_user)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
    #@like = Like.find_by(id: params[:id]).destroy
    #@like.destroy    
  end
end
