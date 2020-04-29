class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = "ログインしました"
      redirect_to @user
    else
      flash.now[:danger] = 'ログイン出来ませんでした'
      render :new
    end
  end

  def destroy
    log_out
    flash[:success] = 'ログアウトしました'
    redirect_to root_url
  end

  private

    def login(email, password)
      @user = User.find_by(email: email)
      if @user && @user.authenticate(password)
        log_in @user
        return true
      else
        return false
      end
    end
end
