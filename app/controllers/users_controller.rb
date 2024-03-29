class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :update, :destroy, :followings, :followers]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :user_image, only: [:update]

#ユーザー一覧画面
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

#ユーザー詳細画面
  def show
    @user = User.find(params[:id])
    @records = @user.records.order(id: :desc).page(params[:page])
    counts(@user)
  end

#アカウント作成
  def new
    @user = User.new
  end

#アカウント登録
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'アカウントを登録しました'
      redirect_to @user
    else
      flash.now[:danger] = 'アカウントの登録が出来ませんでした'
      render :new
    end
  end

#アカウント編集
  def edit
    correct_user
  end

#アカウント更新
  def update
    correct_user
    if @user.update_attributes(user_params)
      user_image
      flash[:success] = 'プロフィールを編集しました'
      redirect_to @user
    else
      render :edit
      flash.now[:danger] = 'プロフィールを変更出来ませんでした'
    end
  end

#アカウント削除
  def destroy
    @user = User.find(params[:id]).destroy
    flash[:success] = 'アカウントを削除しました'
    redirect_to root_path
  end

#フォローしているユーザー
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end

#フォローされているユーザー
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end

#ユーザー検索
  def search
    if params[:name].present?
      @users = User.where('name LIKE ?', "%#{params[:name]}%")
    else
      @users = User.none
    end
  end

  private
#ストロングパラメーター
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
    end

#正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

#ユーザー画像
    def user_image
      if params[:image]
        @user.image_name = "#{@user.id}.jpg"
        image = params[:image]
        File.binwrite("public/user_images/#{@user.image_name}", image.read)
      end
    end

end
