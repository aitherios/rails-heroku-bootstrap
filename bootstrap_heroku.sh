#!/usr/bin/env bash

heroku addons:add heroku-postgresql
heroku addons:add newrelic:standard
heroku addons:add pgbackups:auto-month
heroku addons:add redistogo:nano
heroku addons:add sendgrid:starter
heroku addons:add sentry:developer
heroku addons:add zerigo_dns:basic
