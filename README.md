# Movies Land

>  It is the rails capstone project and is compulsory to master the ruby on rails curriculum. This project is all about articles like a blog app.

## What it does

It's an app for articles.

*As a guest user:*

- You will be able  to create account/log in.
- You will be able to see all articles of other users.
- You will not able to write your article.
- You will not able to give a vote to an article or comment on it.

*As a logged-in user:*

- You will be able to write, edit and delete your article.
- You will be able to vote for an article.

*As an Admin user:*

- You will be able to create, edit and delete any article.
- You will be able to create categories.

# Index Page ScreenShot


![screenshot](public/Capture.JPG)


## Built With

- Ruby 2.7.2
- Rails 6.0.3.4
- Google cloud Services for storage
- VS Code

## Demo


[Live link](https://movies-land007.herokuapp.com//)

## Video Walkthrough of the app

[Video Walkthrough](https://www.loom.com/share/bacba70c58fa4d7f83424c6e44dc6d80)



## Prerequisites

In order to make the program work, you need to have ruby interpreter installed in your system. You can get the latest version of ruby from [official website](https://www.ruby-lang.org/en/downloads/).

# Getting Started

To get a local copy of the repository please run the following commands on your terminal:

- you must have postgresql installed on your local machine.

```
$ cd moviesland2
```

```bash
$ git clone https://github.com/mahmoud717/moviesland2.git
$ cd moviesland2
$ bundle install
$ yarn install --check-files
$ rails db:create
$ rake db:migrate
$ rails s
```
# Creating Categories on a new app

After migrating the database go to your terminal and type:

$ rails console or rails c
$ Category.create(name:'CategoryNameHere',importance:1)

App is designed to work with 4 category section so limit your categories to only 4

# Author

👤 **Mahmoud Mohammad**

- Github: [@mahmoud717](https://github.com/mahmoud717)
- Linkedin: [Mahmoud Mohammad](https://www.linkedin.com/in/mahmoud-m-abbas/)

## Show your support

Give a :star:️ if you like this project!

## Acknowledgments

- <a href="https://guides.rubyonrails.org/" target="_blank">Rails Guides</a>
- Thanks for this Website Design [Nelson Sakwa
](https://www.behance.net/sakwadesignstudio).
