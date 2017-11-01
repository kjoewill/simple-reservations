require 'rails_helper'

describe "Viewing the glider schedules page" do

  gliders = Schedule.managed_gliders

  it "shows the expected header and related text" do

    visit schedules_url
    expect(page).to have_text("Glider Reservations")
    expect(page).to have_text("Schedule for:")

  end

  it "shows evidence of reservations" do

    Schedule.create!([

      {
        day:Date.today,
        glider:gliders[0],
        s0800:"Kevin",
        s0900:"Kevin"
      },
      {
        day:Date.today,
        glider:gliders[1],
        s0900:"Tanya",
        s1000:"Tanya"
      },
      {
        day:Date.today,
        glider:gliders[2],
        s1000:"K2",
        s1100:"K2"
      },
      {
        day:Date.today,
        glider:gliders[3],
        s1100:"Zamb",
        s1200:"Zamb"
      },
      {
        day:Date.today,
        glider:gliders[4],
        s0800:"Star", s0830:"Star", s0900:"Star", s0930:"Star", s1000:"Star", s1030:"Star",
        s1100:"Star", s1130:"Star", s1200:"Star", s1230:"Star", s1300:"Star", s1330:"Star",
        s1400:"Star", s1430:"Star", s1500:"Star", s1530:"Star", s1600:"Star", s1630:"Star"
      }
    ])

    visit schedules_url
    expect(page).to have_text("Kevin", :count => 2)
    expect(page).to have_text("Tanya", :count => 2)
    expect(page).to have_text("K2", :count => 2)
    expect(page).to have_text("Zamb", :count => 2)
    expect(page).to have_text("Star", :count => 18)

    end

end
