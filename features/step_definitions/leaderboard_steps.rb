When(/^I am on leaderboard$/) do
  visit users_path
end

Then(/^I can see on first place user(\d+)$/) do |arg1|
	expect(page).to have_content("#{@user2.username}Star Points: 110")
end

Given(/^there is user(\d+) with (\d+) points$/) do |arg1, arg2|
  @user2 = create(:user)
	@user2.points = 110
	@user2.save
end