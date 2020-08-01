# Workout Tracker

## Overview

A CRUD, MVC workout tracker built using Sinatra. Users may sign-up, login, create a new workout, edit, update, and delete their own workout routines. 

## Instructions

To use this app, clone this repository, run 'bundle install', run 'rake db:migrate', and then run 'shotgun' to start the application.

## Contributors 

- Marcus Lau

### File Structure

```
├── CONTRIBUTING.md
├── Gemfile
├── Gemfile.lock
├── LICENSE.md
├── README.md
├── Rakefile
├── app
│   ├── controllers
│   │   ├── application_controller.rb
│   │   ├── workout_controller.rb
│   │   └── users_controller.rb
│   ├── models
│   │   ├── workout.rb
│   │   └── user.rb
│   └── views
│       ├── index.erb
│       ├── layout.erb
│       ├── workouts
│       │   ├── signup.erb
│       │   ├── edit.erb
│       │   ├── show.erb
│       │   └── index.erb
│       └── users
│           ├── signup.erb
│           └── login.erb
├── config
│   └── environment.rb
├── config.ru
├── db
│   ├── development.sqlite
│   ├── migrate
│   │   ├── 20200728234518_users.rb
│   │   └── 20200728234545_workouts.rb
│   ├── schema.rb
```
