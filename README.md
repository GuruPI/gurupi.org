[![Build Status](https://travis-ci.org/dmitryrck/gurupi.org.svg?branch=master)](https://travis-ci.org/dmitryrck/gurupi.org)

# Gurupi.org

Grupo de Usuários de Ruby do Piauí (Ruby User Group).

## First steps

Git clone:

    $ git clone git://github.com/GuruPI/gurupi.org.git
    $ cd gurupi.org

Copy and edit according the file `config/database.yml`.

    $ cp config/database.yml.example config/database.yml

Install the dependencies:

    $ bundle install

Migrate database:

    $ rake db:setup

Launch the server:

    $ rails server

Go to [http://localhost:3000](http://localhost:3000).

## Running with docker

1. Install [Docker](https://www.docker.com/) and
[docker-compose](https://docs.docker.com/compose/).

2. Copy `config/database.yml`, it is ready to run with docker:

    $ cp config/database.yml.example config/database.yml

3. Run your commands using docker-compose:

    $ docker-compose run web rake db:setup
    $ docker-compose run web

Go to [http://localhost:3000](http://localhost:3000).

## Helping :)

* Fork the project in github;
* Update the code with your feature;
* Create a pull request using github;
