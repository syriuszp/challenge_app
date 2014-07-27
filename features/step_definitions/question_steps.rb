When(/^I create a question$/) do
  visit new_question_path
  fill_in "Title", with: "A simple question"
  fill_in "Contents", with: "Long question description."
  click_button "Save"
end

When(/^I create a question with empty title$/) do
  visit new_question_path
  fill_in "Title", with: ""
  fill_in "Contents", with: "Long question description."
  click_button "Save"
end

Then(/^I should see this question$/) do
  expect(page).to have_content "A simple question"
  expect(page).to have_content "by #{@user.username}"
end

Then(/^I should not see this question$/) do
  expect(page).not_to have_content "A simple question"
  expect(page).not_to have_content "by #{@user}"
end

Given(/^There is a question/) do
  @question = create(:question)
end

Then(/^I do not see "(.*?)" link on this question's page$/) do |link|
  if link == "Delete"
    expect(page).not_to have_content link
  else
    expect(page).not_to have_link eval("#{link.downcase}_question_path(@question)")
  end
end

Given(/^I created a question$/) do
  @question = create(:question, user: @user)
end

When(/^I am on question's page$/) do
  visit question_path(@question)
end


Given(/^not my question exist$/) do
  steps %Q{Given I am user
           When I created a question}
  click_on "Sign out"
end

When(/^I open not my question's page$/) do
  visit question_path @question
end

When(/^I press "(.*?)" link$/) do |link|
  visit question_path @question

  click_on link
end

Then(/^I should see message "(.*?)"$/) do |message|
  expect(page).to have_content message
end
