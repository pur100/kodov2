class SpeakersController < ApplicationController
  before_action :set_speaker, only: [:show, :update, :destroy]

  def index
    @speakers = Speaker.all
  end

  def new
    @speaker = Speaker.new
    # else
      # redirect_to root_path
    # end
     # needed to instantiate the form_for
  end

  def create
   @speaker.save!
  end

  def update
    @event.update(event_params)
    @event.save # needed to instantiate the form_for
    redirect_to event_path
  end

  def edit

  end

  def show
  end

  def destroy
    @user = current_user
    @event.destroy

    # no need for app/views/users/destroy.html.erb
    redirect_to user_path(@user)
  end

  private

  def set_speaker
    @speaker = Speaker.find(params[:id])
  end

  def speaker_params
    params.require(:speaker).permit(:first_name, :last_name, :job_title, :establishments, :specialty, :avatar, :contributions_id)

  end
end
