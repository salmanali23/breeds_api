
# Breeds API

## Functional Requirements

This application allows users to create breeds in the database and fetches images from the Breeds API provided by https://dog.ceo/dog-api/documentation/breed.
### Built with


* [Ruby](https://www.ruby-lang.org/en/)

* [Ruby on Rails](https://rubyonrails.org/)

* [PostgreSQL](https://www.postgresql.org/)

* [RSpec](https://github.com/rspec/rspec-rails)

### Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

*  `ruby 3.1.1`

*  `rails 7.1.0`

### Installation

1. Clone the repo and cd into it
	```
	git clone https://github.com/salmanali23/breeds_api.git
	cd breeds_api
	```
2. Install the gems
	`bundle install`

3. Setup the Database
	`rails db:create`
  `rails db:migrate`

4. Start the server
	`rails s`

5. Run test suits
	`rspec`
