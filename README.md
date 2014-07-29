[![Code Climate](https://codeclimate.com/repos/53ca49ba69568036df008861/badges/92a10b8438ef2bed5e79/gpa.png)](https://codeclimate.com/repos/53ca49ba69568036df008861/feed)
[![Test Coverage](https://codeclimate.com/repos/53ca49ba69568036df008861/badges/92a10b8438ef2bed5e79/coverage.png)](https://codeclimate.com/repos/53ca49ba69568036df008861/feed)

## Training application

I'm just developing my RoR skills thanks to Monterail

### Features

1.  DONE ! Users need to create profiles to add questions and answers.
2.  DONE ! Question has title and contents. Title should be required.
3.  DONE ! Answer has only contents. It should be required.
4.  DONE ! Users can update their questions, but not answers.
5.  DONE ! Users can like answers added by users. It should be visible how many likes each answer has received.
6.  DONE ! Question's author can accept one answer to the question. This answer should be marked as "Accepted".
7.  DONE ! No one can add new answer to a question that already has an accepted answer.
8.  DONE ! Users collect points. New users get 100 points for free.
9.  DONE ! When user's answer is accepted she receives 25 points, when liked she receives 5 points.
10. DONE ! Creating a question costs 10 points.
11. DONE ! Users can set their names and it should be displayed everywhere instead of e-mail.

  Hint: User profiles are implemented using [devise](https://github.com/plataformatec/devise) gem. Check its documentation to find out how to handle additional attributes on registration and edit profile pages.

12. DONE ! Users can upload avatars which should be automatically scaled to 100x100px size.

  Hint: Use a gem that handles file uploads and image manipulation.

13. Once a user reaches 1000 points, she receives Superstar badge that is visible on his profile page.
14. Question's author receives e-mail notification when someone answers his question.
15. User receives e-mail notification when his answer is accepted.
16. DONE ! There is a leaderboard page where users are sorted by points.

17. E-mails are sent via background jobs.

  Often in production environments, time consuming tasks are performed in background, not during user's request. Sending e-mails is such a task because it involves communication with remote servers which may be slow or may not respond. We do not want to make our user wait that long for the response, so we need to respond immediately as if the e-mail has been succesfully sent, but send it in background.
  
18. Users can login using their GitHub accounts.

  People don't like passwords. To make it easy for them many sites allow logging in with Facebook, Twitter or GitHub accounts in a secure way. We're going to use just GitHub.
  
19. DONE ! Liking answers should not reload the page.

  Let's improve user experience a bit. When user likes an answer he should immediately see the result without reloading the whole page. Hint: Try using jQuery javascript library to perform AJAX requests.
  
20. Questions and aswers can be written in Markdown format.

  This `README` file is in Markdown. GitHub automatically formats it and displays a nice readable HTML, we want the same with question and answer contents.

### Development Guidelines

1. Create small, atomic commits.
2. Try to use English for everything from variable names to commit messages.
3. We're using [slim](http://slim-lang.com/) templating engine for views, not ERB which is a default in Ruby world. It's quite easy, but if you don't feel comfortable, feel free to use ERB. The same thing stands for other gems. It's your code, use whatever suits you.
4. Some features are defined in files in `features/features` directory. If you're curious, they're written in Cucumber and this is executable code. You can run it with `bundle exec cucumber` and check if your code satisfies these definitions.
5. If you have any problems ask for help in our public [Chat Room](https://www.hipchat.com/gVsjIkRpD). We really mean it! There's nothing wrong in seeking advice. (Please pay attention to the topic message)

## License

See attached LICENSE.txt file.

Copyright (c) 2014 Monterail.com LLC
