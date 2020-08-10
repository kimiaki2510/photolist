class RecordsController < ApplicationController
  before_action :require_user_logged_in, except: [:index]
  before_action :correct_user, only: [:destory, :edit, :update]

#タイムライン or 未登録時の最初の画面
  def index
    if logged_in?
      @records = current_user.feed_records.order(id: :desc).page(params[:page])
      @like = Like.new
    end
  end

#投稿詳細画面
  def show
    #@record = Record.find(params[:id])
    @record = current_user.records.find(params[:id])
    #@comment = Comment.new
    #@comments = @record.comments.order(created_at: :desc)
  end

#投稿作成画面
  def new
    @record = Record.new
  end

#投稿を作成
  def create
    #byebug
    @record = Record.new(record_params)
    @record.user_id = current_user.id
    if @record.save
      flash[:success] = 'メッセージを投稿しました'
      redirect_to root_url
    else
      @record = current_user.feed_records.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました'
      render :new
    end
  end

#投稿削除
  def destroy
    #byebug
    #@record = current_user.records.find(params[:id])
    @record = Record.find(params[:id])
    if @record.user_id == current_user.id
      @record.destroy
      flash[:success] = 'メッセージを削除しました'
      redirect_to root_url
    end
  end

  private

#ストロングパラメーター(入力値の制限)
    def record_params
      params.require(:record).permit(:title, :photo, :content)
    end

#投稿者のみ確認できる
    def correct_user
      @record = current_user.records.find_by(id: params[:id])
      unless @record
        redirect_to root_url
      end
    end

end
