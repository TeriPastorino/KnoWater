class ActivitiesController < ApplicationController
  
  def index
    @activity = Activity.all
  end

  def new
    @activity = Activity.new
  end
  
  def create
    @user = current_user
    @activity = Activity.new(params[:id])
    @activity.save
  end

  def show
    @activity = Activity.find(activity_params[:id])
  end

  def update
  end

  def edit
  end

  private
    def activity_params
      params.require(:activity_type).permit(:per_use)
    end
end
