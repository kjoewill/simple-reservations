require 'rails_helper'

describe "Navigating schedules" do

  gliders = Schedule.managed_gliders

  it "allows navigation from the listing page to the glider schedule edit page" do

    gsched = Schedule.create(
        day:Date.today,
        glider:gliders[0],
        s0800:"Kevin",
        s0900:"Kevin"
        )


    visit schedules_url

    expect(page).to have_text("Kevin")

    click_link('Reserve', match: :first)

    expect(current_path).to eq(edit_schedule_path(gsched))
    #Seems hokee but I had to look at page source to find the name of the field
    expect(find_field("schedule[s0800]").value).to eq 'Kevin'
    expect(find_field("schedule[s0900]").value).to eq 'Kevin'
    expect(find_field("schedule[s1000]").value).to be_nil
    expect(find_field("schedule[s1100]").value).to be_nil

  end

  it "allows navigation from the listing page to the glider schedule 'new' page" do

    visit schedules_url

    expect(page).to have_text("Glider Reservations")

    #click_link('New', match: :first)
    all('a', :text => 'Reserve')[1].click

    expect(page).to have_text("Editing Schedule:")
    expect(page).to have_text("8:00")
    expect(page).to have_text("9:00")
    expect(page).to have_text("10:00")

  end

  it "allows user to cancel from the 'new' page" do

    gsched = Schedule.create(
        day:Date.today,
        glider:gliders[0],
        s0800:"Kevin",
        s0900:"Kevin"
        )

    visit schedules_url

    expect(page).to have_text("Glider Reservations")

    #click_link "New"
    #click_link('New', match: :first)
    all('a', :text => 'Reserve')[1].click

    expect(page).to have_text("Editing Schedule:")
    expect(page).to have_text("8:00")
    expect(page).to have_text("9:00")
    expect(page).to have_text("10:00")

    click_link('Cancel')

    expect(page).to have_text("Glider Reservations")
    expect(page).to have_text("Kevin")

  end

 it "allows user to cancel from the 'edit' page" do

    gsched = Schedule.create(
        day:Date.today,
        glider:gliders[0],
        s0800:"Tanya"
        )

    visit schedules_url

    expect(page).to have_text("Glider Reservations")

    #click_link('Edit')
    all('a', :text => 'Reserve')[0].click

    expect(page).to have_text("Editing Schedule:")
    expect(page).to have_text("8:00")
    expect(page).to have_text("9:00")
    expect(page).to have_text("10:00")

    expect(find_field("schedule[s0800]").value).to eq 'Tanya'
    fill_in "schedule[s0800]", with: 'Tonya'

    click_link('Cancel')

    expect(page).to have_text("Glider Reservations")
    expect(page).not_to have_text("Tonya")
    expect(page).to have_text("Tanya")

  end

 it "allows user to update using the 'edit' page" do

    gsched = Schedule.create(
        day:Date.today,
        glider:gliders[0],
        s0800:"Tanya"
        )

    visit schedules_url

    expect(page).to have_text("Glider Reservations")
    expect(page).to have_text("Tanya")

    #click_link "New"
    #click_link('Edit')
    all('a', :text => 'Reserve')[0].click

    expect(page).to have_text("Editing Schedule:")
    expect(page).to have_text("8:00")
    expect(page).to have_text("9:00")
    expect(page).to have_text("10:00")
    expect(find_field("schedule[s0800]").value).to eq 'Tanya'
    fill_in "schedule[s0800]", with: 'Tonya'

    click_button "Update Schedule"

    expect(page).to have_text("Glider Reservations")
    expect(page).not_to have_text("Tanya")
    expect(page).to have_text("Tonya")

  end


end
