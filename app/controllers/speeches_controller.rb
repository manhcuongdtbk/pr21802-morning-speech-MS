class SpeechesController < ApplicationController
  load_and_authorize_resource find_by: :slug

  def show
    @location = @speech.location
    @theme = @speech.theme_ids
  end

  def create
    @speech.user = current_user
    if @speech.save
      @speech.create_activity :create, owner: current_user
      flash[:success] = t ".success"
      redirect_to @speech
    else
      render :new
    end
  end

  def update
    if @speech.update_attributes speech_params
      @speech.create_activity :update, owner: current_user
      flash[:success] = t ".success"
      redirect_to speech_path
    else
      render :edit
    end
  end

  def destroy
    @speech.destroy
    @speech.create_activity :destroy, owner: current_user
    SpeechDestroyNotification.warn_user(current_user).deliver_later
    flash[:success] = t ".success"
    redirect_to root_url
  end

  private
  def speech_params
    params.require(:speech).permit :title, :content, :speaking_day,
      :location_id, theme_ids: []
  end
end
