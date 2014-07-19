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
    #save_and_open_page
  puts "P1000: #{answer_author.points.inspect}"
    click_on ">>"
  answer_author.reload  
  @points = answer_author.points
  puts "P7000: #{@points.inspect}"  
  end
  #expect(@user.reload.points).to eq(105)
  puts "P8000: #{@points.inspect}"
  expect(@points).to eq(105)
  
end

When(/^This answer is accepted$/) do
  sign_in_as(@answer.question.author)
  visit question_path(@answer.question)
  within "#answer-#{@answer.id}" do
    click_on "Accept"
  end

  expect(@user.reload.points).to eq(125)
end

And(/^There is a new question with answer$/) do
  @answer = create(:answer)
end
