# Contacts Backend

Contacts Backend is a RESTful API built with Ruby on Rails that allows users to manage a list of contacts and you can see the edit history of particular contact. This repository contains the code for the backend of the application, which includes the database schema, models, controllers, and routes.

## Installation

To use Contacts Backend, you'll need to have Ruby and Rails installed on your machine. You can install them using your favorite package manager, such as Homebrew or Aptitude, or by following the instructions on the [Ruby](https://www.ruby-lang.org/) and [Rails](https://rubyonrails.org/) websites.

Once you have Ruby and Rails installed, you can clone this repository to your machine using Git:

```
git clone https://github.com/railstesh/contacts-backend.git
```

Then, navigate to the project directory and install the required gems:

```
cd contacts-backend
bundle install
```

Next, you'll need to set up the database by running the following commands:

```
rails db:create
rails db:migrate
rails db:seed
```

The `db:create` command will create a new database with the name specified in the `config/database.yml` file. The `db:migrate` command will create the necessary tables in the database based on the schema defined in the `db/schema.rb` file. The `db:seed` command will populate the database with some initial data.

Finally, you can start the server by running the following command:

```
rails server
```

The server will start on port 3000 by default. You can access the API by navigating to `http://localhost:3000` in your web browser.

## Usage

Contacts Backend provides several API endpoints for managing contacts. These endpoints include:

Contacts:

- `GET /contacts`: Returns a list of all contacts in the database.
- `GET /contacts/:id`: Returns a single contact with the specified ID.
- `POST /contacts`: Creates a new contact with the data provided in the request body.
- `PUT contacts/:id`: Updates an existing contact with the data provided in the request body.
- `DELETE /contacts/:id`: Deletes a contact with the specified ID.

Edit Versions:

- `GET /contacts/:contact_id/edit_versions`: Returns a list of all edit history of the contact given in query from the database.

You can test these endpoints using a tool like [Postman](https://www.postman.com/) or by making HTTP requests directly from your application.

## Contributing

If you'd like to contribute to Contacts Backend, you can submit a pull request with your changes. Before submitting a pull request, be sure to run the tests to ensure that your changes don't break any existing functionality:

```
bundle exec rspec
```
