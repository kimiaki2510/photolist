class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :update, :destroy, :followings, :followers]
  before_action :correct_user, only: [:edit, :update]
  before_action :user_image, only: [:update]

  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    @user = User.find(params[:id])
    @records = @user.records.order(id: :desc).page(params[:page])
    counts(@user)
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
      user_image
      flash[:success] = 'プロフィールを編集しました'
      redirect_to @user
    else
      render :edit
      flash.now[:danger] = 'プロフィールを変更出来ませんでした'
    end
  end

  def destroy
    @user = User.find(params[:id]).destroy
    flash[:success] = 'アカウントを削除しました'
    redirect_to root_path
  end

  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end

  def search
    if params[:name].present?
      @users = User.where('name LIKE ?', "%#{params[:name]}%")
    else
      @users = User.none
    end
  end

  #def favs
    #@user = User.find(params[:id])
    #@record = @user.record.order(id: :desc).page(params[:page])
    #@favposts = @user.favposts.page(params[:page])
    #counts(@user)
  #end



  private


    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
    end

    #正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def user_image
      if params[:image]
        @user.image_name = "#{@user.id}.jpg"
        image = params[:image]
        File.binwrite("public/user_images/#{@user.image_name}", image.read)
      end
    end

end
