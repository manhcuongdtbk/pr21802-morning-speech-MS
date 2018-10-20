class StaticPagesController < ApplicationController
  skip_authorization_check only: :home

  def home; end
end
