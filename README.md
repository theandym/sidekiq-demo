# Sidekiq demo

A simple Heroku-based Sidekiq demo app.


## Quick Start

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/theandym/sidekiq-demo)

After deploying, upgrade redis plan (for more connections) and switch dyno type:

```
$ heroku addons:upgrade REDIS_URL heroku-redis:premium-5 -a <app_name>
$ heroku ps:type standard-1x -a <app_name>
```

Next queue some background jobs:

```
$ heroku run "rails c" -a <app_name>

irb(main):001:0> 10000.times { Worker.perform_async }
irb(main):002:0> exit
```

Then scale the number of worker dynos to process jobs in the queue:

```
$ heroku ps:scale worker=1 -a <app_name>
$ heroku ps:scale worker=2 -a <app_name>
```

When complete, scale down the number of dynos, switch dyno type, and downgrade redis plan:

```
$ heroku ps:scale worker=0 -a <app_name>
$ heroku ps:type free -a <app_name>
$ heroku addons:upgrade REDIS_URL heroku-redis:hobby-dev -a <app_name>
```
