# Tea Oclock
<br>
<img src="https://user-images.githubusercontent.com/77654906/148858080-dafd5dc2-87de-4352-9e69-96131fac419c.jpeg" width="85%">

<br>

## Table of Contents

- [Overview](#overview)
- [Local Setup](#local-setup)
- [Setup](#setup)
- [System Dependencies](#system-dependencies)
- [Endpoints](#endpoints)
- [Tools Used](#tools-used)
- [Contributors](#contributors)

## Overview

Tea Oclock is a Rails Api with endpoints for users to subscribe a customer to a tea subscription, cancel a customer's tea subscription, and to see all of a customer's tea subscriptions (including active and cancelled).

## Local Setup

This project requires Ruby 2.7.2.

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
`bundle`
`bundle update`
`rails db:create`
* Run the test suite with `bundle exec rspec`.
* Run your development server with `rails s` to see the app in action.

## Setup
* Ruby version
```
$ ruby -v
ruby 2.7.2p137 (2020-10-01 revision 5445e04352) [x86_64-darwin20]
```

* System dependencies
```
$ rails -v
Rails 5.2.6
```

* Database creation
```
$ rails db:{create,migrate}
```

* How to run the test suite
```
$ bundle exec rspec
```

## Endpoints


## Tools Used

| Development | Testing       | Gems          |
|   :----:    |    :----:     |    :----:     |
| Ruby 2.7.2  | RSpec         | SimpleCov     |
| Rails 5.2.6 | Rubocop       | Pry           |
| Github      |               | Figaro        |
| Atom        |               | ShouldaMatcher|
| Postman     |               | VCR           |
|             |               | Webmock       |
|             |               | PostgresQL    |
|             |               | Postico       |
|             |               | Faraday       |
|             |               | Bcrypt        |
|             |               |               |



## Contributors

👤  **Ezzedine Alwafai**
- [GitHub](https://github.com/ealwafai)
- [LinkedIn](https://www.linkedin.com/in/ezzedine-alwafai/)
