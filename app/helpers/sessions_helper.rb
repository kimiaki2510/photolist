module SessionsHelper

  #渡されたユーザーをログイン
  def log_in(user)
    session[:user_id] = user.id
  end

  #ユーザーのログアウト
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  #現在ログイン中のユーザーを返す(いる場合)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  #ユーザーがログインしていればtrue
  def logged_in?
    !!current_user
  end

  #渡されたユーザーがログイン済みであればtrueを返す
  def current_user?(user)
    user == current_user
  end
end
