#@Comment
You might consider cleaning up the unused files in the app. Clean code bases are a great skill to have. 

The application is overall pretty good quality for an intern level application and I think you did well.
---

This project demonstrates the use of three public APIs, they are as follows:
1. Youtube Public API
2. Twitter Public API
3. Github Public API

All of the above API are interacted with this application using different ways. For instance: 

1. For Youtube Public API, I have used official google docs for Ruby language.

2. For Twitter, I have used twitter gem.

3. For Github Public API, I have used net/https library.

Build Instructions

1. rvm use 2.2.1
2. bundle install
3. rake db:create
4. rake db:migrate
5. rails s

Replace env. variables in twitter controller and youtube controller with yours in order to run the application.

Heroku link: http://web-application-assignment.herokuapp.com/