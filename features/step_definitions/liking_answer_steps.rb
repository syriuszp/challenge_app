And(/^I like that answer$/) do
  visit question_path(@answer.question)
  within "#answer-#{@answer.id}" do
    click_on ">>"
  end
end

Then(/^That answer should have (\d+) like(s?)$/) do |count, suffix|
  within "#answer-#{@answer.id}" do
    expect(page).to have_content("#{count} like#{suffix}")
  end
end

When(/^This answer is liked$/) do
  answer_author = User.find(@answer.user_id)
  click_on "Sign out"
  sign_in_as(@answer.question.author)
  visit question_path(@answer.question)
  within "#answer-#{@answer.id}" do
   click_on ">>"
  end
end

When(/^This answer is accepted$/) do
  click_on "Sign out"
  sign_in_as(@answer.question.author)
  visit question_path(@answer.question)
  within "#answer-#{@answer.id}" do
    click_on "Accept"
  end
end

And(/^There is a new question with answer$/) do
  @answer = create(:answer)
end
