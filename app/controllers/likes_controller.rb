class LikesController < ApplicationController
  before_action :require_user_logged_in

  def create
    byebug
    @record = Record.find(params[:id])
    unless @record.iine?(current_user)
      @record.iine(current_user)
      redirect_to root_path
      #respond_to do |format|
        #format.html { redirect_to root_path }
        #format.js
      #end
    end
  end

  def destroy
    #byebug
    #@record = Like.find(params[:id]).record
    @record = Record.find(params[:id])
    if @record.iine?(current_user)
      @record.uniine(current_user)
      redirect_to root_path
      #respond_to do |format|
        #format.html { redirect_to root_path }
        #format.js
      #end
    end
  end
end
