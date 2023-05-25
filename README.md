
![App Brewery Banner](Documentation/AppBreweryBanner.png)

#  Quizzler

## Description
This app is a Trivia Quiz app.

I created this app as part of the [App Brewery's "Complete iOS App Development Bootcamp'' course on Udemy](https://www.udemy.com/course/ios-13-app-development-bootcamp/).

Building on the lessons from the previous module [Egg Timer](https://github.com/cervania-aldrich/Egg-Timer), I started to learn more about iOS App Design Patterns and Code structuring, which includes the MVC pattern and Swift Structures.

I am particularly proud of building this app because, firstly, I have adapted the app to my own using real-life medical school questions rather than general knowledge questions, because I wanted to see what it would be like to build a multiple-choice quiz that was more academic-oriented (multiple-choice quiz apps are the most popular styles of educational apps on the App Store). Secondly, I further built my confidence and problem solving skills when it comes to innovating on top of the base app, as I did in the Egg Timer project. 

As this app was made for learning purposes, I have added many comments and documentation markup in order to be as descriptive as possible. It has been an effective learning strategy for me. I found this has helped me understand the Swift language and the Apple Developer documentation better. Also, it helped me not fall into the trap of just copying code from a tutorial, rather I’m reassuring myself that I actually understand the code being written and why it was written. Furthermore, I recognise that documenting code is an important skill to have as a Software Developer, and I believe it is worth practising.

## Instructions
Clone this repository in Xcode to run the project. Run it in the simulator.

Questions will be displayed one at a time, and each question has 6 potential answers. Click on one of the answers to play the quiz. Also, click the topic button (Initially named “Rheumatology”) to change the topic, hence show a different set of questions (e.g. “Renal”).

## Learning Objectives
What did I learn? How did building this app improve my iOS development skills?

There are several concepts that I was able to learn whilst developing this app. This includes:

* How to programmatically change UI elements such as Labels and Buttons.
* Learn what is a design pattern, and how it is used in programming.
* How to use the MVC pattern.
* Learn about 2D arrays.
* Learn about Swift Structures and how to instantiate a struct instance.
* Learn the difference between properties and methods, functions and methods.
* Learn about immutability and the mutating keyword.
* How to refactor code and stay organised.

## What makes this project stand out?
To improve my understanding, I added extra features to the app. This includes:

* Use real-life medical school revision questions instead of the given quiz from the course.
* In the course we implement 1 quiz. In my version, I implement 3 unique quizzes, and the user can select which quiz they would like to do through a button, which then shows a UIAlertController to showcase these different quiz types. (Renal Quiz, Rheumatology Quiz and Cardiovascular Quiz).
* In the course, we create 2 buttons for the user to select 2 possible answers for each question (True/False). In my app version, there are 6 buttons for the user to select 6 possible answers for each question.
* Add constants file to organise and store all quiz information, including a new title property that describes the type of question being asked (E.g. In the Cardiovascular quiz, there is a Heart Failure question, and a Chest Pain Question). This helps users understand the problem better.
* Progress View has rounded edges and is bigger.
* Use UIView.animate instead of timer() to update the UI in a smoother fashion.
* Refactor the code for improved readability.
* Add comments to help explain my code.
* Use the DocC framework to add Swift documentation to guide end-users reviewing the code.

>This is a companion project to The App Brewery's Complete App Development Bootcamp, check out the full course at [www.appbrewery.co](https://www.appbrewery.co/)

![End Banner](Documentation/readme-end-banner.png)

