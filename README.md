**PROJECT DOCUMENTATION

Ruby Version Used:- 2.7.1

Rails Version :- Rails 6.0.3.2

ENV:- rvm 1.29.10

To Get this project Up and Running, just go through to your project directory and run 
```Bundle install``` **Assuming bundler, rubies are already installed

Then, next step would be to setup Database Migrations.
Just run ```rake db:setup``` in the project directory.

Once Everything is installed and migrations are successfully migrated, run ```rails s``` to run the rails server and using any API testing tool, you can check any API(s). 

**API DOCUMENTATION

API NAME:- REGISTRATIONS API/ Create a new User

API Endpoint:- '/auth'

Request Type:- POST

Parameters for the API:- first_name, last_name, email, password, password_confirmation

Headers for the API:- None

Response:- 

```
{
  "status": "success",
  "data": {
    "uid": "alex@dispostable.com",
    "id": 4,
    "email": "alex@dispostable.com",
    "provider": "email",
    "first_name": "alex",
    "last_name": "hales",
    "allow_password_change": false,
    "created_at": "2020-08-27T19:34:16.033Z",
    "updated_at": "2020-08-27T19:34:16.260Z"
  }
}
```

API Name:-  Sessions API/ Sign in a User

API Endpoint:- 'auth/sign_in'

Request Type:- POST

Parameters for the API:- email, password

Headers for the API:- none

Response:-

```
{
  "data": {
    "id": 4,
    "email": "alex@dispostable.com",
    "provider": "email",
    "uid": "alex@dispostable.com",
    "first_name": "",
    "last_name": "hales",
    "allow_password_change": false
  }
}
```

API Name:- DESTROY SESSION/ Signs out a User

API Endpoint:- '/auth/sign_out'

Request Type:- DELETE

Parameters for the API:- email, password

Headers for the API:- uid, access-token, client **won't work if any header is missing, will throw 401

Response:-

```
{
  "success": true
}
```


API Name:- Create Subscriptions(Naming Should have been payments)/ Make payments

API Endpoint:- '/subscriptions'

Request Type:- POST

Parameters for the API:- amount, currency, card_number, card_expiry_month, card_expiration_year, card_type, user_id

Headers for the API:- uid, access-token, client **won't work if any header is missing, will throw 401

Response:-

```
{
    "id": 33,
    "amount": "100.0",
    "currency": "USD",
    "card_type": "debit_card",
    "card_details": {
        "number": "4111111111111111",
        "expiry_month": 9,
        "expiry_year": 2020
    },
    "status": "Success",
    "authorization_code": "a069941e9a90473d70c107517d6965f1",
    "subscription_time": "2020-08-27T19:48:28.399Z"
}
```


API Name:- View All Subscriptions of the current logged in user

API Endpoint:- '/subscriptions'

Request Type:- GET

Parameters for the API:- None

Headers for the API:- uid, access-token, client **won't work if any header is missing, will throw 401

Response:-

If Data is available

```
[
  {
    "id": 4,
    "amount": "100.0",
    "currency": "USD",
    "card_type": "debit_card",
    "card_details": {
      "number": "4111111111111111",
      "expiry_month": 2,
      "expiry_year": 2020
    },
    "status": "Success",
    "authorization_code": "94c6fdb86fceeccccfa22ac672fc89d5",
    "subscription_time": "2020-08-27T07:33:27.812Z"
  },
  {
    "id": 5,
    "amount": "100.0",
    "currency": "USD",
    "card_type": "debit_card",
    "card_details": {
      "number": "4111111111111111",
      "expiry_month": 2,
      "expiry_year": 2020
    },
    "status": "Success",
    "authorization_code": "ec88f13c9c1aa22b41fb0702a4942b95",
    "subscription_time": "2020-08-27T15:01:34.712Z"
  },
  {
    "id": 6,
    "amount": "100.0",
    "currency": "USD",
    "card_type": "debit_card",
    "card_details": {
      "number": "4111111111111111",
      "expiry_month": 2,
      "expiry_year": 2020
    },
    "status": "Success",
    "authorization_code": "1e8db233a19b72e66b095d15ad0d8529",
    "subscription_time": "2020-08-27T15:02:47.612Z"
  }
]
``` 


If no data is available or no subscription/payments made yet


```
{
  "status": "No Data Found",
  "data": "No Data Found, try adding some subscriptions"
}
```

**TESTs DOCUMENTATION

Tool Used:- `Rspec`
To check all the unit tests, cd to the project directory and execute command: 

``` Bundle exec rspec ```

This command will run all the request and model tests.
