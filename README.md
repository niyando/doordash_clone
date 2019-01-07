# Rails Graphql Ecommerce App

A simple ecommerce app with server based on Ruby on Rails 5 and client written in Vue.js. The API endpoints are based on GraphQL.

## Server Setup

1. Clone the repo
2. Install gems: `bundle`
3. Setup and seed database: `rails db:setup`
4. Start server: `rails s`

## Client Setup

1. Change directory: `cd /client/doordash`
2. Install node packages: `npm install`
3. Start server: `npm run dev`

## Features

1. Authentication (Login and Register)
2. Browse food items
3. Add/Remove items to Cart.
4. Ability to create a group cart and share with other people
5. Abilility to add/remove items to shared carts

## Yet to do

1. Guest user - so a user can add to cart/group-cart without login.
2. Graphl subscription to update group cart items using web sockets


