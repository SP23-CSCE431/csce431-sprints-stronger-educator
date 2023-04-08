# README

## Introduction

This application is for use by Stronger Educator team members and their customers to view and manage public school data.

## Requirements

This code has been run and tested on:

- Ruby - 3.1.2
- Rails - 7.0.4.2
- Ruby Gems - Listed in `Gemfile`
- PostgreSQL - 1.1
- Docker (Latest Container)


## External Dependencies

- Docker - Download latest version at https://www.docker.com/products/docker-desktop
- Heroku CLI - Download latest version at https://devcenter.heroku.com/articles/heroku-cli
- Git - Download latest version at https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
- GitHub Desktop (Not required but helpful) at https://desktop.github.com/

## Installation

Download this code repository by using git:

`git clone https://github.com/SP23-CSCE431/csce431-sprints-stronger-educator/`

## Tests

An RSpec test suite is available and can be run using:

`rspec spec/` or `rails spec .`

## Execute Code

Run the following code in Windows PowerShell if using Windows or the terminal using Linux/Mac:

To install the app: `bundle install && rails webpacker:install && rails db:create && db:migrate`

To run the app: `rails server --binding:0.0.0.0`

The application can then be navigated to in your browser by entering the URL http://localhost:3000/

## Environmental Variables/Files

Not yet implemented

## Deployment

Deployment will be from Heroku with continuous deployment from 

## CI/CD

CI/CD has not been implemented fully yet

## Support

The support of this app is still in development

## Extra Help

Please contact Angel Ham at angelalexham@tamu.edu

## Credit
Stronger Educator supplementary application built with Ruby on Rails by
Angel Ham, Michael Pham, Ethan McKinney, Andrew Zehrer

CSCE 431 - Software Engineering
Texas A&M University