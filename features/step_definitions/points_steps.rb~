Then(/^I should have (\d+) points earned$/) do |points|
  expect(@answer_author.reload.points.to_s).to eq(points)
end

Then(/^I should have (\d+) points$/) do |points|
  expect(@user.reload.points.to_s).to eq(points)
end

Given(/^I have (\d+) points$/) do |points|
  @user.points = points
  @user.save!
end

