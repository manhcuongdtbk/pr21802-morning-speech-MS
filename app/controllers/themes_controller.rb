class ThemesController < ApplicationController
  before_action :find_theme

  def index
    @pagy, @themes = pagy(Theme.all, items: 10)
  end

  def show
  end

  def new
    @theme = Theme.new
  end

  def create
    @theme = Theme.new theme_params
    if @theme.save
      flash[:success] = t ".success"
      redirect_to themes_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @theme.update_attributes theme_params
      flash[:success] = t ".success"
      redirect_to themes_path
    else
      render :edit
    end
  end

  def destroy
    @theme.destroy
    flash[:success] = t ".success"
    redirect_to themes_path
  end

  private
  def theme_params
    params.require(:theme).permit :title
  end

  def find_theme
    @theme = Theme.find_by id: params[:id]
  end
end
