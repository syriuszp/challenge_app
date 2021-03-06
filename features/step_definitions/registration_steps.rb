require 'securerandom'

When(/^I create a profile$/) do
  email = "email#{SecureRandom.hex(12)}@example.com"
  name = "username#{SecureRandom.hex(12)}"

  visit new_user_registration_path

  fill_in "Username", with: name
  fill_in "Email", with: email
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
  click_button "Sign up"

  @user = User.find_by(email: email)

end

