<div align="center">
    
# Tea Oclock
<br>
<img src="https://user-images.githubusercontent.com/77654906/148858080-dafd5dc2-87de-4352-9e69-96131fac419c.jpeg" width="90%">
</div>
<br>

## Table of Contents

- [Overview](#overview)
- [Local Setup](#local-setup)
- [Setup](#setup)
- [Schema](#schema)
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


## Schema 

![Schema](https://user-images.githubusercontent.com/77654906/148860077-504e6482-ad51-46f6-92f2-213c2f7fb287.png)


## Endpoints

The base path of each endpoint is:
```
http://localhost:3000/api/v1
```


**Create a new tea subscription for an existing customer**

Happy Path

Example Request:

```
POST /api/v1/customers/{:id}/memberships

With the following JSON body:

{
    "tea_id": "5",
    "subscription_id": "2",
}
```

Example Response:

```
201 (Created)

{
    "data": {
        "id": "11",
        "type": "memberships",
        "attributes": {
            "tea_id": 5,
            "customer_id": 3,
            "subscription_id": 2,
            "active": true
        }
    }
}
```

Sad Path

Example Request:

```
POST /api/v1/customers/{:id}/memberships

With the following JSON body:

{
    "tea_id": "2",
    "subscription_id": "3000",
}
```

Example Response

```
404 (Not Found)

{
    "errors": [
        "Couldn't find Subscription with 'id'=3000"
    ]
}
```


**Show all of the customer's tea subscriptions (active and inactive)**

Happy Path

Example request:

```
GET /api/v1/customers/{:id}/memberships

```

Example Response:

```
{
    "data": [
        {
            "id": "1",
            "type": "memberships",
            "attributes": {
                "tea_id": 1,
                "customer_id": 1,
                "subscription_id": 1,
                "active": true
            }
        },
        {
            "id": "2",
            "type": "memberships",
            "attributes": {
                "tea_id": 2,
                "customer_id": 1,
                "subscription_id": 1,
                "active": true
            }
        },
        {
            "id": "3",
            "type": "memberships",
            "attributes": {
                "tea_id": 3,
                "customer_id": 1,
                "subscription_id": 2,
                "active": true
            }
        },
        {
            "id": "4",
            "type": "memberships",
            "attributes": {
                "tea_id": 4,
                "customer_id": 1,
                "subscription_id": 2,
                "active": true
            }
        },
        {
            "id": "5",
            "type": "memberships",
            "attributes": {
                "tea_id": 5,
                "customer_id": 1,
                "subscription_id": 2,
                "active": true
            }
        }
    ]
}
```

Sad Path

Example request:

```
GET /api/v1/customers/{:invalid_id}/memberhships

```

Example Response:

```
{
    "errors": [
        "Couldn't find Customer with 'id'=3000"
    ]
}
```


**Cancel a customer's tea subscription**

Example Request:

```
PATCH /api/v1/customers/{:id}/memberships/1

With the following JSON body:

{
    "active": "false",
}
```

Example Response:

```
{
    "data": {
        "id": "1",
        "type": "memberships",
        "attributes": {
            "tea_id": 1,
            "customer_id": 1,
            "subscription_id": 1,
            "active": false
        }
    }
}
```


## Tools Used

| Development | Testing       | Gems          |
|   :----:    |    :----:     |    :----:     |
| Ruby 2.7.2  | RSpec         | SimpleCov     |
| Rails 5.2.6 |               | Pry           |
| Github      |               | PostgresQL    |
| Atom        |               | ShouldaMatcher|
|             |               |               |
|             |               |               |


## Contributors

👤  **Ezzedine Alwafai**
- [GitHub](https://github.com/ealwafai)
- [LinkedIn](https://www.linkedin.com/in/ezzedine-alwafai/)
