# Redmine WillDeploy Plugin

Plugin to vote for Deploy or Not.

## Features

Quorum of 2 is minimal PASS to deploy.

## Reason?

Everytime after release we have lots of `hot commits to deploy`. Such things can't just go to production if you
have strict release cycle. At this point better solutions is to VOTE on such ideas. Quorum of 2 people is enough to
make decision about that.

Tickets will gain special filterable field `Deploy?` to group by and have track of tickets to deploy at some point.

## HowTo

- Checkout as `plugins/will_deploy` folder
- `rake redmine:plugins:migrate`
- Enable for Project under `Modules` tab
- Make sure that your CustomField `Deployed?` assigned to Tracker types and projects
- Start voting

## SHOW TIME
### New tracker block at Issue page
![Plugin](screenshots/info_block.png?raw=true)
### Custom field to rule em all!
![Plugin](screenshots/custom_field.png?raw=true)


## Author

[Alexander Tsirel @noma4i](https://github.com/noma4i)

## Contribution Guide

Open Issue or send PR ;)
