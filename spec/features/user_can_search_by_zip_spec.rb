require 'rails_helper'

RSpec.feature "Zipcode Searching", type: :feature do
  scenario "User searches by zipcode" do
    VCR.use_cassette('feature#zip_search') do
      visit root_path

      within ".form-inline" do
        fill_in :q, with: "80203"
        click_button "Locate"
      end

      # save_and_open_page
      # expect(current_path).to eq "/search?zip=80203"

      within ".results" do
        # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
        # And the stations should be limited to Electric and Propane
        # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
      end
    end
  end
end
