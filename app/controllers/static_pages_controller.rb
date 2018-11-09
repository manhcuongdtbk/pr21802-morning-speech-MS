class StaticPagesController < ApplicationController
  skip_authorization_check only: :home

  def home
    redirect_to themes_path if current_user
  end

  def about
  end
end
