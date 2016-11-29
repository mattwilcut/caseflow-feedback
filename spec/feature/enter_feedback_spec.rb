require "rails_helper"
require "pry"

RSpec.feature "Enter feedback" do
  scenario "Load Feedback page" do
    visit "/feedback/new"
    expect(page).to have_content("Tell us about your experience with Caseflow Certification")
    expect(page).to have_css("#feedback_feedback")
    page.should have_button("Cancel")
    fill_in "feedback_feedback", with: "Feedback"
    click_on "Send Feedback"
    expect(page).to have_content("Thanks for your feedback!")
    expect(page).to have_content("Back to Caseflow Certification")
    click_on "Send in more feedback"
    expect(page).to have_content("Tell us about your experience with Caseflow Certification")
    fill_in "feedback_feedback", with: "Feedback"
    click_on "Send Feedback"
    expect(page).to have_content("Thanks for your feedback!")
    page.should have_link("Back to Caseflow Certification", href: "https://www.va.gov")
  end

  scenario "Visit Admin page" do
    visit "/admin"
    expect(page).to have_content("Unauthorized")
  end
end
