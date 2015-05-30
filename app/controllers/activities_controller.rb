class ActivitiesController < ApplicationController
  
  def index
    @activities = Activity.all
  end

  def new
    @activity = Activity.new
  end
  
  def create
    @user = current_user
    @activity = Activity.new(activity_params)
    @activity.save
    redirect_to @activities
  end

  def show
    @activity = Activity.find(params[:activity_id])
  end

  def choose

  end

  def update
  end

  def edit
  end

  private
    def activity_params
      params.require(:activity).permit(:per_use)
    end
end
