class ApplicationController < ActionController::Base

  include SessionsHelper
  private

#ログイン判別
    def require_user_logged_in
      unless logged_in?
        flash[:danger] = "ログインしてください"
        redirect_to login_path
      end
    end

#カウント
    def counts(user)
      @count_records = user.records.count
      @count_followings = user.followings.count
      @count_followers = user.followers.count
      #@count_likes = user.likes.count
    end

end
