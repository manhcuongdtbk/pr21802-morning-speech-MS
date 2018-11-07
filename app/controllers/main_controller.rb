class MainController < ApplicationController
  def search
    @speeches = Speech.ransack(title_cont: params[:q]).result distinct: true

    respond_to do |format|
      format.html {}
      format.json do
        @speeches = @speeches.limit 5
      end
    end
  end
end
