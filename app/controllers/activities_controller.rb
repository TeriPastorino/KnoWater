class ActivitiesController < ApplicationController

 
  def index
    #@activities = Activity.all
    if params[:start_date] && params[:end_date]
       @activities = current_user.activities.between(Date.strptime(params[:start_date], "%m/%d/%Y"), Date.strptime(params[:end_date], "%m/%d/%Y"))
      
     else
       @activities = Activity.today
     end
      @day_total  = Activity.today.sum(:ounces)/128
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = current_user.activities.build(activity_params)
    if @activity.save
      flash[:notice] = @activity.log_notice
      redirect_to choose_activity_path
    else
      flash[:error] = "No Activity logged"
      render :new
    end
  end



  
  # def create
  #   @user = current_user
  #   #wont work because not including high efficiency
  #   @activity = current_user.activities.today.find_or_initialize_by(activity_type: params[:activity][:activity_type])
  #   @activity.per_use = @activity.per_use.to_i + params[:activity][:per_use].to_i    
  #   if @activity.save
  #      flash[:notice] = @activity.log_notice
  #      redirect_to choose_activity_path
  #   else 
  #     flash[:notice] = "You did not log any activities"
  #     redirect_to choose_activity_path    
  #   end
  # end

  def show
    @activity = Activity.find(params[:id])
  end

  def choose
    @day_total  = Activity.today.sum(:ounces)/128
    @activities_by_type = current_user.activities.today.group(:activity_type).sum(:ounces) 
  end

  def update
  end


  def edit
    @activity = Activity.find(params[:id])
      flash[:notice] = "#{activity_type} log was updated"
  end

  private
    def activity_params
      params.require(:activity).permit(:per_use, :activity_type, :high_efficiency)
    end
end
