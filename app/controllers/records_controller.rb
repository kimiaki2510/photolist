class RecordsController < ApplicationController
  before_action :require_user_logged_in, except: [:index]
  before_action :correct_user, only: [:destory]

  def index
    if logged_in?
      @record = current_user.records.build #form with用
<<<<<<< HEAD
      @records = current_user.feed_records.order(id: :desc).page(params[:page])  
=======
      @records = current_user.feed_records.order(id: :desc).page(params[:page])

>>>>>>> e9de204305f40acce5356bd52dd38915ce7108f3
    end
  end

  def show
    @record = current_user.records.find(params[:id])
  end

  def new
    @record = Record.new
  end

  def create
    @record = current_user.records.new(record_params)
    if @record.save
      flash[:success] = 'メッセージを投稿しました'
      redirect_to root_url
    else
      flash.now[:danger] = 'メッセージの投稿に失敗しました'
      render :new
    end
  end

  def destroy
    @record.destroy
    flash[:success] = 'メッセージを削除しました'
    redirect_back(fallback_location: root_path)
  end

  private

    def record_params
      params.require(:record).permit(:title, :photo, :content)
    end

    def correct_user
      @record = current_user.records.find_by(id: params[:id])
      unless @record
        redirect_to root_url
      end
    end

end
