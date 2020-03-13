class ContributionsController < ApplicationController
  before_action :set_contribution, only: [:show, :update, :destroy]

  def index
    @contributions = Contribution.all
  end

  def new
    @contribution = Contribution.new
    # else
      # redirect_to root_path
    # end
     # needed to instantiate the form_for
  end

  def create
   @contribution.save!
  end

  def update
    @contribution.update(contribution_params)
    @contribution.save # needed to instantiate the form_for
    redirect_to contribution_path
  end

  def edit

  end

  def show
  end

  def destroy
    @contribution.destroy

    # no need for app/views/users/destroy.html.erb
    redirect_to root_path
  end

  private

  def set_contribution
    @contribution = Contribution.find(params[:id])
  end

  def contribution_params
    params.require(:contribution).permit(:events_id, :speakers_id)
  end
end
