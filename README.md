# Spectrm - Messages API

## API Overview:

This API is built through the Ruby on Rails framework (v6.0), according to RESTful architectural principles. It utilises a PostgreSQL db and the message data is delivered as JSON. 
Each of the following is true about a message: 
* it has a non-guessable identifier (UUID v4),
* it can contain characters coming from different languages,
* it does not support the usage of html tags,
* it has a maximum number of chars (255 characters),
* e-mail(s) and http link(s) can be part of the message,
* it has an internal counter of how many times the message was retrieved (unsigned number)

## API Usage:

The API can be interacted either locally or through the deployed version hosted on Heroku:

### Remote User:

The base URL is https://api-messages-spectrm.herokuapp.com/api/v1/messages

### Local Use: 

#### This API installation requires the use of:
* Github
* Rails
* Ruby

### Install Ruby and Rails with the follwing commands:
```shell
$ rbenv install 2.6.6
$ gem install rails
```

### Clone this repository into the relevant local directory
```shell
$ git clone https://github.com/euangt/spectrm-api
$ cd spectrm-api
```

### Once this is done, in the terminal run: 
```shell
$ bundle install # Will install the relevant gems (modules)
$ rails db:create db:migrate # Will constructs the database and schema
$ rails s # This starts the server 
```
If mock-data is wanted to test API functionality, the following command can be called to generate data: 
```shell
$ rails db:seed # Will create 10 'messages' in the db
```
This API has been built through a TDD framework. To run tests please enter the following command:
```shell
$ rails test
```

At this point, API requests can be made to the base url of `<localhost:3000/api/v1>`

## Making API calls: 

It is recommended that API calls are made with a Rest Client, such as Postman, for managing the requests. 

## Retrieve all messages:
Please place a GET request to the base URL to return all db entries, their UUID, content and counter values. 

## Retrieve a single message:
Please append '/<MessageUUID>' to the base URL as part of a GET request. This will increase the retrieval_count of the chosen message by +1.
 
## Update a message: 
Please append '/<MessageUUID>' to the base URL as part of a PATCH (PUT) request. 
If using Postman (or similar) please update the content using JSON format in the body of the request, for example: 
`{ "content": "updated message" }`
  
## Create a message: 
Please generate a POST request to the base URL. 
lease update the content using JSON format in the body of the request, for example: 
`{ "content": "new message" }`

## Delete a method: 
Please generate a DELETE request to the base URL appended by '/<MessageUUID>'
