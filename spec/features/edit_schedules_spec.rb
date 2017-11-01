require 'rails_helper'

describe "Editing a glider schedule" do

  gliders = Schedule.managed_gliders

  it "Saves to the database and appears back on the index page" do

    glider_schedule = Schedule.create!([
      {
        day:Date.today,
        glider:gliders[0],
        s0800:"Kevin",
        s0900:"Kevin"
      }
    ])

    visit schedules_url
    expect(page).to have_text("Kevin", :count => 2)

    click_link('Reserve', match: :first)
    expect(current_path).to eq(edit_schedule_path(glider_schedule))

    expect(find_field("schedule[s0800]").value).to eq 'Kevin'

    fill_in "schedule[s0800]", with: 'Not Kevin'

    click_button "Update Schedule"
    expect(page).to have_text("Not Kevin")

  end

end
