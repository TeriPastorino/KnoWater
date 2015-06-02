class ActivitiesController < ApplicationController
 before_filter :check_for_cancel, :only => [:create, :update]

 
  def index
    @activities = Activity.all
    @day_total  = Activity.today.sum(:ounces)/128
  end

  def new
    @activity = Activity.new
  end
  
  def create
    @user = current_user
    @activity = Activity.new(activity_params)
    @activity.user = current_user
    if @activity.save
      #take out our change per activity_type
      flash[:notice] = "You logged a #{@activity.per_use} minute #{@activity.activity_type}"
      redirect_to choose_activity_path
    else activty.destroy?
      flash[:notice] = "You did not log any activities"
      redirect_to choose_activity_path    
    end
  end

  def show
    @activity = Activity.find(params[:id])
    # @activity = 
  end

  def choose
  end

  def update
  end

  def check_for_cancel
    if params[:commit] == "Cancel"
      redirect_to choose_activity_path
    end
  end

  def edit
  end

  private
    def activity_params
      params.require(:activity).permit(:per_use, :activity_type)
    end
end
