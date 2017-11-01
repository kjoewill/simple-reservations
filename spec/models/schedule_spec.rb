require 'rails_helper'

describe "Schedule.schedule_for_day" do

  gliders = Schedule.managed_gliders

  it "provides a full day's schedule on a day without existing schedules" do

    scheds = Schedule.schedule_for_day(Date.today)

    expect(scheds.count).to eq(gliders.size)
    scheds.each_with_index { |s, i| expect(s.glider).to eq(gliders[i]) }
    scheds.each {|s| expect(s.day).to eq(Date.today)}

  end


  it "pads empty space in the schedule with newly created schedules" do

    day = Date.parse('3rd Feb 2001')

    schedule1 = Schedule.create(day: day, glider: gliders[0], s0800: "Kevin")
    schedule2 = Schedule.create(day: day, glider: gliders[1], s0900: "Tanya")
    schedule3 = Schedule.create(day: day, glider: gliders[2], s1000: "K2")

    scheds = Schedule.schedule_for_day(day)

    expect(scheds.size).to eq(gliders.size)

    expect(scheds[0].glider).to eq(schedule1.glider)
    expect(scheds[0].s0800).to eq("Kevin")

    expect(scheds[1].glider).to eq(schedule2.glider)
    expect(scheds[1].s0900).to eq("Tanya")

    expect(scheds[2].glider).to eq(schedule3.glider)
    expect(scheds[2].s1000).to eq("K2")

    scheds.each {|s| expect(s.day).to eq(day)}

  end


  it "returns shedules in Glider order regardless of creation order" do

    day = Date.parse('3rd Feb 2001')

    Schedule.create(day: day, glider: gliders[2], s1000: "K2")
    Schedule.create(day: day, glider: gliders[1], s0900: "Tanya")
    Schedule.create(day: day, glider: gliders[0], s0800: "Kevin")

    scheds = Schedule.schedule_for_day(day)

    expect(scheds.size).to eq(gliders.size)

    expect(scheds[0].s0800).to eq("Kevin")
    expect(scheds[1].s0900).to eq("Tanya")
    expect(scheds[2].s1000).to eq("K2")

    scheds.each {|s| expect(s.day).to eq(day)}

  end


  it "can manage a full days schedule" do

    day = Date.parse('3rd Feb 2001')

    Schedule.create(day: day, glider: gliders[0],
      s0800:"A",
      s0830:"B",
      s0900:"C",
      s0930:"D",
      s1000:"E",
      s1030:"F",
      s1100:"G",
      s1130:"H",
      s1200:"I",
      s1230:"J",
      s1300:"K",
      s1330:"L",
      s1400:"M",
      s1430:"N",
      s1500:"O",
      s1530:"P",
      s1600:"Q",
      s1630:"R"
      )

    scheds = Schedule.schedule_for_day(day)

    expect(scheds.size).to eq(gliders.size)

    expect(scheds[0].s0800).to eq("A")
    expect(scheds[0].s0830).to eq("B")
    expect(scheds[0].s0900).to eq("C")
    expect(scheds[0].s0930).to eq("D")
    expect(scheds[0].s1000).to eq("E")
    expect(scheds[0].s1030).to eq("F")
    expect(scheds[0].s1100).to eq("G")
    expect(scheds[0].s1130).to eq("H")
    expect(scheds[0].s1200).to eq("I")
    expect(scheds[0].s1230).to eq("J")
    expect(scheds[0].s1300).to eq("K")
    expect(scheds[0].s1330).to eq("L")
    expect(scheds[0].s1400).to eq("M")
    expect(scheds[0].s1430).to eq("N")
    expect(scheds[0].s1500).to eq("O")
    expect(scheds[0].s1530).to eq("P")
    expect(scheds[0].s1600).to eq("Q")
    expect(scheds[0].s1630).to eq("R")

    scheds.each {|s| expect(s.day).to eq(day)}

  end

end
