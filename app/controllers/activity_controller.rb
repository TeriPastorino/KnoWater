class ActivityController < ApplicationController
  
  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new(activity_params)
    @activity.save
  
  def create
    @user = current_user
    @activity = Activity.create (activity_params[:activity])


  end

  def show
    @activity = Activity.find(params[:id])
  end

  def update
  end

  def edit
  end

  private
    def activity_params
      params.require(:activity)
    end
end
