# README

## Introduction

This application is for use by Stronger Educator team members and their customers to view and manage public school data.

## Requirements

This code has been run and tested on:

- Ruby - 3.1.2
- Rails - 7.0.4.2
- Ruby Gems - Listed in `Gemfile` (- Simplecov, Brakeman, RuboCop, omniauth)
- PostgreSQL - 1.1
- Docker - 4.16.1

## Documentation

Our product and sprint backlog is located in Jira: https://red-pandas-chillin-dog.atlassian.net/jira/software/projects/RPCD/boards/1
Other documentation can be found through our Project Turnover sent directly to the customer

## External Dependencies

- Docker - Download latest version at https://www.docker.com/products/docker-desktop
- Heroku CLI - Download latest version at https://devcenter.heroku.com/articles/heroku-cli
- Git - Download latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
- GitHub Desktop (Not required but helpful) at https://desktop.github.com/

## Tools
- GitHub
- RuboCop
- SimpleCov
- Jira
- OAuth2

## Installation

Download this code repository by using git:

`git clone https://github.com/SP23-CSCE431/csce431-sprints-stronger-educator/`

## Tests

An RSpec test suite is available and can be run using:
- rspec 5.0.0
`rspec spec/` or `rails spec .`

## Execute Code

Run the following code in Windows PowerShell if using Windows or the terminal using Linux/Mac:

To install the app: `bundle install && rails webpacker:install && rails db:create && db:migrate`

To run the app: `rails server --binding:0.0.0.0`

The application can then be navigated to in your browser by entering the URL http://localhost:3000/

## Environmental Variables/Files

Google OAuth 2 requires two keys client and client secret in the environment folder under config/environments/production at the bottom of the file

ENV['GOOGLE_OAUTH_CLIENT_ID'] = 'YOUR_GOOGLE_OAUTH-CLIENT_ID_HERE'

ENV['GOOGLE_OAUTH_CLIENT_SECRET'] = 'YOUR_GOOGLE_OAUTH_CLIENT_SECRET_HERE'

## Deployment

If the user wants to setup a new pipeline instead of using the existing pipeline
Setup a Heroku account: https://signup.heroku.com/

From the Heroku dashboard select `New` -> `Create New Pipline`

Name the pipeline, and link the respective git repo to the pipeline

Our application does not need any extra options, so select `Enable Review Apps` right away

Click `New app` under review apps, and link your test branch from your repo

Under staging app, select `Create new app` and link your main branch from your repo

https://stronger-educator-app.herokuapp.com/

## CI/CD

For continuous development, we set up Heroku to automatically deploy our apps when their respective github branches are updated.

  `Review app: test branch`

  `Production app: main branch`

For continuous integration, we set up a Github action to run our specs, security checks, linter, etc. after every push or pull-request. This allows us to automatically ensure that our code is working as intended.

## Support

Support documents will be provided to the customer.

## Extra Help

Please contact Angel Ham at angelalexham@tamu.edu

## Credit
Stronger Educator supplementary application built with Ruby on Rails by
Angel Ham, Michael Pham, Ethan McKinney, Andrew Zehrer

CSCE 431 - Software Engineering
Texas A&M University
