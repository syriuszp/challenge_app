Then(/^I should see my name$/) do
  expect(page).to have_content @user.username
end

When(/^I change username on "(.*?)"/) do |name|
  visit edit_user_registration_path @user
  fill_in "Username", with: name
  fill_in "Current password", with: "password"
  click_on "Update"
end

Then(/^I should see my new name$/) do
  expect(page).to have_content "otheruser"
end