require "rails_helper"

feature "managing magazines" do
	scenario "can add to a list of magazines that link to their own pages" do
		visit root_path
		expect(page).to have_content "There are currently no magazines"
		expect(page).to_not have_content "Browsing All Magazines"

		click_on "New Magazine"
		expect(current_path).to eq new_magazine_path
		click_on "Create New Magazine"

		expect(page).to have_content("Unable to save magazine. Please fill out every field")

		fill_in "Title", with: "Field and Stream"
		fill_in "Edition", with: 10
		fill_in "Issue", with: "11/11/2011"
		fill_in "Language", with: "English"

		click_on "Create New Magazine"
		expect(current_path).to eq magazine_path(Magazine.last)
		expect(page).to have_content("Field and Stream Edition 10 Successfully Added")

		visit current_path
		expect(page).to_not have_content("Field and Stream Edition 10 Successfully Added.")
		expect(page).to have_content("Currently Viewing Field and Stream Edition 10. Published 11/11/2011 in English")
		
		nat_geo = create_magazine({title: "National Geographic", edition: 1, issue: "11/11/2011", language: "French"})
		visit magazine_path(nat_geo)

		expect(page).to_not have_content("Currently Viewing Field and Stream Edition 10. Published 11/11/2011 in English")
		expect(page).to have_content("Currently Viewing National Geographic Edition 1. Published 11/11/2011 in French")

		click_on "View All Magazines"
		expect(current_path).to eq root_path
		expect(page).to_not have_content "There are currently no magazines"
		expect(page).to have_content "Browsing All Magazines"
		expect(page).to have_link "Field and Stream"

		click_on "National Geographic"
		expect(current_path).to eq magazine_path(nat_geo)
	end

	scenario "can update existing magazines" do
		nat_geo = create_magazine({title: "National Geographic", edition: 1, issue: "11/11/2011", language: "French"})
		visit magazine_path(nat_geo)
		expect(page).to have_content("Currently Viewing National Geographic Edition 1. Published 11/11/2011 in French")
		click_on "Edit"

		fill_in "Title", with: ""
		fill_in "Edition", with: 10
		fill_in "Issue", with: "11/11/2011"
		fill_in "Language", with: "English"

		click_on "Update Magazine"
		expect(page).to have_content("Something went wrong")

		fill_in "Title", with: "Field and Stream"
		click_on "Update Magazine"

		expect(current_path).to eq magazine_path(nat_geo)
		expect(page).to have_content("Currently Viewing Field and Stream Edition 10. Published 11/11/2011 in English")
		expect(page).to_not have_content("Currently Viewing National Geographic Edition 1. Published 11/11/2011 in French")
	end

	scenario "can delete magazines" do
		nat_geo = create_magazine({title: "National Geographic", edition: 1, issue: "11/11/2011", language: "French"})
		visit magazine_path(nat_geo)
		click_on "Delete Magazine"
		expect(current_path).to eq root_path

		expect(page).to have_content "There are currently no magazines"
	end
end