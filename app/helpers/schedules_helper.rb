
require 'uri'
module SchedulesHelper

  def link_to_edit_or_new(sched)
    if sched.id
      link_to "Reserve", edit_schedule_path(sched)
    else
      link_to "Reserve", new_schedule_path(:new_schedule_date => sched.day, :new_schedule_glider => sched.glider)
    end
  end

  #Create and return 2D array of values from list of schedule objects
  def array_from_schedule(scheds)
      scheds.map { |s| [
        s.s0800, s.s0830, s.s0900, s.s0930, s.s1000, s.s1030, s.s1100, s.s1130, s.s1200, s.s1230,
        s.s1300, s.s1330, s.s1400, s.s1430, s.s1500, s.s1530, s.s1600, s.s1630 ] }
  end

  def time_for_index(index)
    t_column = [
      "8:00", "8:30", "9:00", "9:30", "10:00", "10:30", "11:00", "11:30", "12:00", "12:30",
      "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30"]
    t_column[index]
  end

    #After update we want to return to the index page but show reservations for the
    #date of the glider schedule we updated.  Modify schedules_url to include arugemnt for the
    #specific day to be used for the index action above
    def schedule_url_for(schedule)
     # "#{schedules_url}?utf8=✓&q=#{schedule.day.to_s}"
        "#{schedules_url}?q=#{schedule.day.to_s}"
    end

    ##
    #Return a Rails Boostrap datepicker
    def date_picker
      text_field_tag(:q, value = @schedules.first.day, "data-provide" => 'datepicker', "data-date-format" => 'yyyy-mm-dd', "data-date-today-btn" => "linked", "data-date-today-highlight" => true, "data-date-days-of-week-highlighted" => [0,6], "data-date-disable-entry" => true, "data-date-orientation" => "bottom-right" )
    end

end
