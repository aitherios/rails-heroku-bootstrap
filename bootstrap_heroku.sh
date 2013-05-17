#!/usr/bin/env bash

heroku addons:add heroku-postgresql:dev
heroku addons:add newrelic:standard
heroku addons:add pgbackups:auto-month
heroku addons:add redistogo:nano
heroku addons:add sendgrid:starter
heroku addons:add sentry:developer
heroku addons:add zerigo_dns:basic
heroku addons:add logentries:tryit
heroku addons:add scheduler:standard
heroku addons:add deployhooks:email

heroku config:add APP_HOSTNAME=`heroku domains |grep 'herokuapp.com'`
