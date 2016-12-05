# Quaker CRM

A simple CRM that allows Quaker meetings/churches to keep track of the people and ministries in their community.

[Visit the live site here!](https://quaker-crm.herokuapp.com/)

## How to Use the Site

To test out the web application before creating your own account, feel free to use the following demo account, which has already been set up:

1. Username: `test@email.com`
2. Password: `password`

## ER Diagram

![ER-Diagram](http://i.imgur.com/cK0hTWC.png =250x)

## How to Clone and Set Up Locally

1. Clone Respository: `git clone https://github.com/micahbales/quaker-crm.git`
2. Create database: `rake db:create`
3. Migrate database: `rake db:migrate`
4. Run local server: `rails s` to view on localhost:3000
5. Run test suite: `rake`
