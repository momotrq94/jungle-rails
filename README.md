# Jungle

A mini e-commerce application built with Rails 6.1 for understanding rails. It represents a plant store where users can sign up and purchase plants. An Admin portion has also been built in to create new products and categories for the website. The user passwords are hashed using Bcrypt. E2E Testing done using cypress.

## Screenshots

!["screenshot of Homepage"](https://github.com/momotrq94/jungle-rails/blob/master/public/Jungle-Homepage.png)
!["screenshot of Cart"](https://github.com/momotrq94/jungle-rails/blob/master/public/Jungle-Cart.png)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios. Any future date can be used with any 3 digit cvc number.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
