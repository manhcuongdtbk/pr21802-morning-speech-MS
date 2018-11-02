class UsersController < ApplicationController
  before_action :find_user, only: :show

  def show
  end

  private
  def find_user
    @user = User.friendly.find params[:id]
    return if @user

    flash[:info] = t ".info"
    redirect_to root_url
  end
end
