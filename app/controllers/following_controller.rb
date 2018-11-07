class FollowingController < ApplicationController
  def index
    @title = t ".following"
    @user  = User.friendly.find params[:user_id]
    @pagy, @users = pagy @user.following, items: 10
    render "users/show_follow"
  end
end
