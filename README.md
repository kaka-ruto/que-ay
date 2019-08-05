# Que-Ay (Questions & Answers)

A simple app that users can answer simple investment questions and see their results

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Installing

Clone the project:

```
git clone https://github.com/borenho/que-ay.git
```

Change directory (cd) into `que-ay` and set up your db (will create the db and
seed it):

```
bundle exec rake db:setup
```

Start the Rails server

```
bin/rails server
```

Open the application

```
http://localhost:3000
```

### Tests

Run the tests

```
bundle exec rspec
```

View test coverage (run the following in your terminal)

```
open coverage/index.html
```

### Thanks

[Richard Baptist](https://github.com/rpbaptist) from [Lendahand](https://www.lendahand.com) - Thanks for the challenge!
