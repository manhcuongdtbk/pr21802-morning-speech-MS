class RelationshipsController < ApplicationController
  before_action :find_user, only: %w(create destroy)

  def create
    current_user.follow @user
    respond_to do |format|
      format.html{redirect_to @user}
      format.js
    end
  end

  def destroy
    current_user.unfollow @user
    respond_to do |format|
      format.html{redirect_to @user}
      format.js
    end
  end

  private

  def find_user
    @user = if params[:action] == "create"
      User.friendly.find params[:followed_id]
    elsif params[:action] == "destroy"
      Relationship.find_by(id: params[:id])&.followed
    end

    return if @user

    flash[:info] = t ".info"
    redirect_to root_url
  end
end
