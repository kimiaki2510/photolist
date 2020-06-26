class LikesController < ApplicationController
  before_action :require_user_logged_in

  def create
    #byebug
    @like = current_user.likes.create(record_id: params[:record_id])
    redirect_to root_path

    #@record = Record.find(params[:id])
    #unless @record.iine?(current_user)
      #@record.iine(current_user)
      #respond_to do |format|
        #format.html { redirect_to root_path }
        #format.js
      #end
    #end
  end

  def destroy
    @like = Like.find_by(record_id: params[:record_id], user_id: @current_user.id)
    @like.destroy
    redirect_to root_path
    #byebug
    #@record = Like.find(params[:id]).record
    #@record = Record.find(params[:id])
    #if @record.iine?(current_user)
      #@record.uniine(current_user)
      #respond_to do |format|
        #format.html { redirect_to root_path }
        #format.js
      #end
    #end
  end
end
