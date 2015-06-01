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
    flash[:notice] = "You logged a #{@activity.per_use} minute #{@activity.activity_type}"
    redirect_to choose_activity_path
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def choose
  end

  def update
  end

  def edit
  end

  private
    def activity_params
      params.require(:activity).permit(:per_use, :activity_type)
    end
end
