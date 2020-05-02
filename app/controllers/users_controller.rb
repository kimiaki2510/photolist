class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @user = User.find(params[:id])
    @records = @user.records.order(id: :desc).page(params[:page])
    #counts(@user)
  end

  def new
    @user = User.new
  end

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

  def edit
    correct_user
  end

  def update
    correct_user
    if @user.update_attributes(user_params)
      flash[:success] = 'プロフィールを編集しました'
      redirect_to @user
    else
      render :edit
      flash.now[:danger] = 'プロフィールを変更出来ませんでした'
    end
  end

  def destroy
  end

  private


  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end

  #正しいユーザーかどうか確認
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

end
