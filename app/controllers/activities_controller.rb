class ActivitiesController < ApplicationController

 
  def index
    if params[:start_date] && params[:end_date]
       @actvities = Activity.between(Date.strptime(params[:start_date]), Date.strptime(params[:end_date]))
     else
       @activities = Activity.today
     end
      @day_total  = Activity.today.sum(:ounces)/128
  end

  def new
    @activity = Activity.new
  end
  
  def create
    @user = current_user
    @activity = current_user.activities.today.find_or_initialize_by(activity_type: params[:activity][:activity_type])
    @activity.per_use = @activity.per_use.to_i + params[:activity][:per_use].to_i    
    if @activity.save
       flash[:notice] = @activity.log_notice
       redirect_to choose_activity_path
    else 
      flash[:notice] = "You did not log any activities"
      redirect_to choose_activity_path    
    end
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def choose
    @day_total  = Activity.today.sum(:ounces)/128

  end

  def update
  end


  def edit
    @activity = Activity.find(params[:id])
      flash[:notice] = "#{activity_type} log was updated"
  end

  private
    def activity_params
      params.require(:activity).permit(:per_use, :activity_type)
    end
end
