require 'rails_helper'

RSpec.feature "Zipcode Searching", type: :feature do
  scenario "User searches by zipcode" do
    visit root_path

    within ".search-form" do
      fill_in "zipcode", with: "80203"
      click_button "Search"
    end

    # expect(path).to be "#{Root.path}/search?zip=80203"

    within ".results" do
      # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
      # And the stations should be limited to Electric and Propane
      # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
    end
  end
end
