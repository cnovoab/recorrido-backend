# recorrido-alerts-api

A simple app for manage alerts on bus travels tickets prices

Please follow this steps:

1. rake db:setup -> (db:migrate && db:seed if no db creation permission is granted. i.e. Heroku)
2. rails s
3. bundle exec sidekiq

# Create users and alerts
## Please do this with a client. If no client available, use this requests:
### Create user
```
curl -i -X POST 'http://localhost:3000/users' -d '{ "user": { "name": "Demo", "email": "my.mail@mail.com", "password": "p4ssw0rd", "password_confirmation": "p4ssw0rd" } }' -H 'Content-Type: application/json'
```
### Login [Get jwt]
```
curl -i -X POST 'http://localhost:3000/auth/login' -d '{ "email": "my.mail@mail.com", "password": "p4ssw0rd" }' -H 'Content-Type: application/json'
```
### Create alert (example from Santiago to Osorno)
```
curl -i -X POST 'http://localhost:3000/alerts' -d '{ "alert" : { "departure_city_id": 9333, "destination_city_id": 9189, "user_id": 1, "name": "My Alert", "price": 19000 } }' -H 'Content-Type: application/json' -H 'Authorization: jwt-obtained-on-previuos-step'
```
### Once you have created an alert, you can run the task to create the searches for bus travels
`rake bus_travel:lookup`

## To check the search results: (used @ chart widget)
```curl -i -X GET 'http://localhost:3000/alerts/:alert_id/lookups' -H 'Authorization: your-jwt'```

## To check the search details: (used @ table widget)
```curl -i -X GET 'http://localhost:3000/alerts/:alert_id/lookups/latest/bustravels' -H 'Authorization: your-jwt'```
