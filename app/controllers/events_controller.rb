class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy, :summarize]

  def index
    @events = Event.all
  end

  def new
    @user = current_user
    # if current_user.superadmin_role? || current_user.supervisor_role?
      @event = Event.new
    # else
      # redirect_to root_path
    # end
     # needed to instantiate the form_for
  end

  def create

   @event = Event.new(event_params)
   @user = current_user
   @event.user = @user
    if @event.save!
      redirect_to new_event_speaker_path(@event)
    else
      render :new
    end
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

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :location, :category, :description, :seats, :picture, :speakers, :starts_at, :ends_at, :user_id)
  end
end
