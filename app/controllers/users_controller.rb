class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]

  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'アカウントを登録しました'
      redirect_to @user
    else
      flash.now[:danger] = 'アカウントの登録が出来ませんでした'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
