
##
# A Schedule instance represents a specific gliders scheduled reservations for a
# day.  The state held by an instace are the gliders name, the reporesented day
# and time slots.  Reservations for a glider are indicated by a name (any string)
# existing in a particular time slot.

class Schedule < ApplicationRecord

  @@managed_gliders = ['N2689H (2-33)','N820SB (L-23)','N747S (1-26)','N7643 (1-34)', 'Tow Only']
  @@managed_time_slots = [
      :s0800, :s0830, :s0900, :s0930, :s1000, :s1030, :s1100, :s1130, :s1200,
      :s1230, :s1300, :s1330, :s1400, :s1430, :s1500, :s1530, :s1600, :s1630
     ]

  def self.managed_gliders
    @@managed_gliders
  end
  def self.managed_time_slots
    @@managed_time_slots
  end


  def self.schedule_for_day(day)
    existing_schedules = where(:day => day)
    if existing_schedules.empty?
      self.blank_day(day)
    else
      merge_slots(blank_day(day), existing_schedules)
    end
  end

  private

      # I should probably make a new constructor that takes a glider name
      # and simplify this
      def self.blank_day(day)
        gliders = Schedule.managed_gliders
        schedules = []
        gliders.each do |glider|
          sched = Schedule.new
          sched.glider = glider
          sched.day = day
          schedules.push(sched)
        end
        schedules
      end

      #Given two arrays A, B ... replace any elements in A if there is an
      #element in B with the same value for "glider"
      def self.merge_slots (a, b)

        #convert to hashes
        a_hash = a.map { |s| [s.glider, s] }.to_h
        b_hash = b.map { |s| [s.glider, s] }.to_h

        #replace
        b_hash.each_key {|k| a_hash[k] = b_hash[k]}

        #back to an aray
        a_hash.values

      end

end
