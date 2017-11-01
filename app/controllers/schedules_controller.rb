class SchedulesController < ApplicationController


  def index
    if params[:q].present?
      date = Date.strptime(params[:q], '%Y-%m-%d')
      @schedules  = Schedule.schedule_for_day(date)
    else
      @schedules = Schedule.schedule_for_day(Date.today)
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    sched_params = params.require(:schedule).permit(Schedule.managed_time_slots)


##
#      :s0800, :s0830, :s0900, :s0930, :s1000, :s1030, :s1100, :s1130, :s1200,
#      :s1230, :s1300, :s1330, :s1400, :s1430, :s1500, :s1530, :s1600, :s1630
#      )


    @schedule.update(sched_params)
    redirect_to schedule_url_for(@schedule)
  end


  def new
    @schedule = Schedule.new(day: params[:new_schedule_date], glider: params[:new_schedule_glider])
  end

  def create
    sched_params = params.require(:schedule).permit(
      :day, :glider,
      :s0800, :s0830, :s0900, :s0930, :s1000, :s1030, :s1100, :s1130, :s1200,
      :s1230, :s1300, :s1330, :s1400, :s1430, :s1500, :s1530, :s1600, :s1630
      )
    @schedule = Schedule.new(sched_params)
    @schedule.save
    redirect_to schedule_url_for(@schedule)
  end

  private

    #After update we want to return to the index page but show reservations for the
    #date of the glider schedule we updated.  Modify schedules_url to include arugemnt for the
    #specific day to be used for the index action above
    def schedule_url_for(schedule)
      #{}"#{schedules_url}?utf8=✓&q=#{schedule.day.to_s}"
      "#{schedules_url}?q=#{schedule.day.to_s}"
    end

end
