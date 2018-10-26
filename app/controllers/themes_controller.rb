class ThemesController < ApplicationController
  load_and_authorize_resource param_method: :theme_params

  def index
    @pagy, @speeches = pagy Speech.all.created_at_desc, items: 10
  end

  private
  def theme_params
    params.require(:theme).permit :title
  end
end
