# trellotracker.herokuapp.com
## Requirements
* Gem 'rails_12factor' added to the Gemfile
* An heroku account
* Heroku toolbelt installed

## Steps on the shell

Login
```shell
heroku login
```

Add your SSH keys to heroku
```shell
ssh-keygen -t rsa -C "pietro.dibello@xpeppers.com"
heroku keys:add ~/.ssh/id_rsa.pub
```

```shell
heroku apps:create trellotracker
heroku addons:add mongohq:sandbox --app trellotracker
heroku ps:scale web=1
heroku addons:add papertrail:choklad
```

```shell
git push heroku master (thesameofganzodigomma)
```

```shell
heroku config:set TRACCO_ENV=production
heroku config:set RAILS_ENV=production

heroku config:set developer_public_key=<here put the key taken from https://trello.com/1/appKey/generate>
heroku config:set access_token_key=<here put the token taken in the 'Reading Private Data' section from https://trello.com/1/appKey/generate>
heroku config:set tracker_username=<here put the Trello member used as recipient of the tracking notifications>
heroku config:set google_docs_username=<here put your Google Docs username>

heroku config:unset DATABASE_URL
```

```
heroku run bundle exec tracco collect 2013.03.23 -e production
```
