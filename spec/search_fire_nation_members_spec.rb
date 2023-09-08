require "rails_helper"

RSpec.feature "Search Fire Nation Members", type: :feature, js: true do
  scenario "User searches for Fire Nation members" do
    visit "/"
  
    select "Fire Nation", from: "nation"
    
    click_button "Search For Members"

    expect(current_path).to eq("/search")

    # total number of people close to 100 from the Fire Nation
    expect(page).to have_content("Total number of people in the Fire Nation:")

    # list of the first 25 members
    expect(page.all(".member-info")).to have_at_least(25).items

    # make sure each member has the expected information
    within first(".member-info") do
      expect(page).to have_css("img") # Check for a photo if available
      expect(page).to have_content("Name:")
      expect(page).to have_content("Allies:")
      expect(page).to have_content("Enemies:")
      expect(page).to have_content("Affiliations:")
      expect(page.all(".member-info")).to have_at_least(25).items
    end

    # double check that you're not hardcoding the number 25 in your test
    # check the attirbutes of the first member
    # check 1 thing on member 2 or last member
  end
end
