class ThemesController < ApplicationController
  load_and_authorize_resource param_method: :theme_params

  def index
    @pagy, @themes = pagy(Theme.all, items: 10)
  end

  def show; end

  def new
    @theme = Theme.new
  end

  def create
    if @theme.save
      flash[:success] = t ".success"
      redirect_to themes_path
    else
      render :new
    end
  end

  def edit; end

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
end
