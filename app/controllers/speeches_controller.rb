class SpeechesController < ApplicationController
  load_and_authorize_resource param_method: :speech_params

  def index
    @pagy, @speeches = pagy Speech.all, items: 10
  end

  def show
    @location = @speech.location
    @theme = @speech.theme_ids
  end

  def new
    @speech = Speech.new
  end

  def create
    if @speech.save
      flash[:success] = t ".success"
      redirect_to @speech
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @speech.update_attributes speech_params
      flash[:success] = t ".success"
      redirect_to speech_path
    else
      render :edit
    end
  end

  def destroy
    @speech.destroy
    flash[:success] = t ".success"
    redirect_to speeches_path
  end

  private
  def speech_params
    params.require(:speech).permit :title, :content, :speaking_day, :location_id, theme_ids: []
  end
end
