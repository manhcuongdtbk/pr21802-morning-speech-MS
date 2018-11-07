class FollowersController < ApplicationController
  def index
    @title = t ".followers"
    @user  = User.friendly.find params[:user_id]
    @pagy, @users = pagy @user.followers, items: 10
    render "users/show_follow"
  end
end
