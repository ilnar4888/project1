require "rails_helper"

feature "Feedback create" do
  let!(:user) { create :user }
  let(:visitor_name) { "Ivan" }
  let(:visitor_email) { "ivan@gmail.com" }
  let(:text) { "Ruby on rails test" }

  background do  
    visit new_feedback_path
  end
  
  scenario "Visitor create feedback " do
    fill_in "feedback_name", with: visitor_name
    fill_in "feedback_email", with: visitor_email
    fill_in "feedback_text", with: text
    click_button "Create Feedback"
    expect(page).to have_content(visitor_name)
    expect(page).to have_content(visitor_email)
    expect(page).to have_content(text)
  end

  scenario "User create feedback " do
    fill_in "feedback_name", with: user.full_name
    fill_in "feedback_email", with: user.email
    fill_in "feedback_text", with: text
    click_button "Create Feedback"
    expect(page).to have_content(user.full_name)
    expect(page).to have_content(user.email)
    expect(page).to have_content(text)
  end

  scenario "User create new feedbackck with invalid params" do
    click_button "Create Feedback"
    expect(page).to have_content("can't be blank")
  end
end
