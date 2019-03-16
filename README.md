# recorrido-alerts-api

A simple app for manage alerts on bus travels tickets prices

Please follow this steps:

1. rake db:setup
2. rails s

# Create users and alerts
## Please do this with a client. If no client available, use this requests:
3. Create user
curl -i -X POST 'http://localhost:3000/users' -d '{ "user": { "name": "Demo", "email": "my.mail@mail.com", "password": "p4ssw0rd", "password_confirmation": "p4ssw0rd" } }' -H 'Content-Type: application/json'

# 2. Login [Get jwt]
curl -i -X POST 'http://localhost:3000/auth/login' -d '{ "email": "my.mail@mail.com", "password": "p4ssw0rd" }' -H 'Content-Type: application/json'

# 3. Create alert (example from Santiago to Osorno)
curl -i -X POST 'http://localhost:3000/alerts' -d '{ "alert" : { "departure_city_id": 9333, "destination_city_id": 9189, "user_id": 1, "name": "My Alert", "price": 19000 } }' -H 'Content-Type: application/json' -H 'Authorization: jwt-obtained-on-previuos-step'
