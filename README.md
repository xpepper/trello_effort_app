# Trello Effort App
A bare minimal web app to show tracking data extrated from Trello with the [trello_effort_tracker](https://github.com/xpepper/trello_effort_tracker) gem. [Read this](https://github.com/xpepper/trello_effort_tracker/blob/master/README.md) to understand what's the idea behind this.

## What is Trello Effort App?
Trello Effort App shows the Trello cards on which you add tracking data as defined by the [trello_effort_tracker](https://github.com/xpepper/trello_effort_tracker) gem.

## Usage

```shell
git clone git://github.com/xpepper/trello_effort_app.git
```

Then cd in the lib and copy the config template

```shell
cd trello_effort_app
cp config/config.template.yaml config/config.yml
```

and then fill the correct values in the placeholders in config.yml (read the ["Where do I get an API key and API secret?"](https://github.com/xpepper/trello_effort_tracker/#where-do-i-get-an-api-key) section).

Then copy the mongoid config template

```shell
cp config/mongoid.template.yaml config/mongoid.yml
```

and fill the correct values for the mongodb environments ([see here](http://mongoid.org/en/mongoid/docs/installation.html#configuration) to have more details).

Then run bundle to get all the required gems:

```shell
bundle install
```

## Requirements
* [mongoDB](http://www.mongodb.org/) - macosx users with homebrew will just run 'brew install mongodb' to have mongoDB installed on their machine.
* (optional) [rvm](https://rvm.io/rvm/install/) is useful: if you like, use the .rvmrc.template file.


## Rake tasks
The trello_effort_tracker's rake tasks are available on the rails app too.

```ruby
rake 'run:today[test]' # will extract today's tracked data and store on the test db

rake run:today  # will extract today's tracked data and store on the default (that is development) db

rake 'run:from_day[2012-11-1, production]'  # will extract tracked data starting from November the 1st, 2012 and store them into the production db
```

### Configuration params
### Mongo storage configuration
Tracking data collected from Trello are stored in a MongoDB database.

There are two env variables you can set to configure mongodb

- `MONGOID_ENV` defines which mongodb env is actually used (development, test, production). Development is the default mongo environment.
- `MONGOID_CONFIG_PATH` defines the path to the mongoid configuration file (default is `config/mongoid.yml`)

A standard mongoid.yml is the following:

```yml
development:
  sessions:
    default:
      database: trello_effort_tracker_dev
      hosts:
        - localhost:27017
test:
  sessions:
    default:
      database: trello_effort_tracker_test
      hosts:
        - localhost:27017
production:
  autocreate_indexes: true
  persist_in_safe_mode: true

  sessions:
    default:
      database: trello_effort_tracker_production
      hosts:
        - localhost:27017
```

## Keeping your tracking database up to date
You may install a crontab entry to run the trello tracker periodically, for example

```shell
SHELL=/Users/futur3/.rvm/bin/rvm-shell
GEMSET="ruby-1.9.3-p385@spikes"
PROJECT_PATH="/Users/$USER/Documents/workspace/trello_effort_app"
LC_ALL=en_US.UTF-8

# m h  dom mon dow   command
*/10 * * * *  rvm-shell $GEMSET -c "cd $PROJECT_PATH;  bundle exec rake run:today[production]" >> /tmp/crontab.out 2>&1
```

## Contributing
If you'd like to hack on Trello Effort App, start by forking the repo on GitHub:

https://github.com/xpepper/trello_effort_app

The best way to get your changes merged back into core is as follows:

1. Clone down your fork
1. Create a thoughtfully named topic branch to contain your change
1. Hack away
1. Add tests and make sure everything still passes by running `rake spec`
1. If you are adding new functionality, document it in the README
1. If necessary, rebase your commits into logical chunks, without errors
1. Push the branch up to GitHub
1. Send a pull request for your branch

[@pierodibello](http://twitter.com/pierodibello)
