class ActivitiesController < ApplicationController
  
  def index
    @activity = Activity.all
  end

  def new
    @activity = Activity.new
  end
  
  def create
    @user = current_user
    raise
    @activity = Activity.new(activity_params)
    @activity.save
  end

  def show
    @activity = Activity.find(params[:activity_id])
  end

  def activities_choose
    
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
