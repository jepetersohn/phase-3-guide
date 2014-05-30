# Getting Your Rails App Ready for the Major League

Note: This doc is aimed towards hosting on Heroku. Many of these tips apply to any Rails host, but the details won't be the same.

Heroku is incredibly convenient but the defaults aren't entirely appropriate as web apps grow. This doc provides some tips for improving your app's performance, acting responsible with your data and handling the kind of issues you only experience in production.

## Postgres Backups

A poorly written DB migration or slip up in console can be all it takes to loose data in production. Heroku offers a free backup add-on for Postgres databases. As part of the free plan Heroku offers either weekly or monthly backups. Weekly backups are the default.

Adding backups to an existing app is easy, just run the following command in your app directory:

```
heroku addons:add pgbackups
```

You can immediately capture a backup by running:

```
heroku pgbackups:capture
```

For more details see the Heroku [docs](https://devcenter.heroku.com/articles/pgbackups) for Postgres backups (including downloading and restoring existing backups).

## Loading Production Data Locally

Sometimes debugging an issue in production isn't safe when debugging might require potentially modifying live data. If you can't reproduce a similar enough set of test data locally, sometimes loading a copy of the production database locally can help.

### Steps

1. Create a backup of the db: `heroku pgbackups:capture` (add the pgbackups add on if this step fails)
2. Download the backup:
```
curl -o production.dump `heroku pgbackups:url`
```

3. Load the backup locally: `psql [APP_NAME]_development < production.dump`

## Watching Logs with Heroku

In production, you can't just watch the web server logs in the console like you do in development and you don't get the error messages on the screen.  So how do you debug a production issue?

Logs are still being generated in production and they are saved to file. (In the free version, only the last 1,500 lines are saved, though.)  

You can access the heroku logs by running `herokyu logs`.

If you want to see a specific request in realtime, you can access `heroku logs --tail`.

Check out the [Heroku docs](https://devcenter.heroku.com/articles/logging) for more information.

## Exception Notifying

If you app hits an exception in production, you aren't notified by default. Which is a real shame because things can be breaking for end users and you aren't aware anything has gone wrong!

Let's fix that by adding an expectation notifier. This is a bit of code that will catch any exceptions and email us when anything goes wrong. We'll even get the stack trace right in the email! How neat is that?

The [exception_notification](https://github.com/smartinez87/exception_notification) gem supports a number of notification methods, including email. You'll need to arrange for your own SMTP service if you want email notifications. Gmail or [Mandril](http://mandrill.com/) are decent choices for mail delivery.

[Airbrake]() by thoughtbot is a SaaS exception handling service commonly used in Rails shops.  It is available as a [Heroku add-on](https://addons.heroku.com/airbrake), but doesn't have a free tier.


## Switching to Unicorn

From the Heroku docs:

> Web applications that process requests concurrently make much more efficient use of dyno resources than web applications that only process one request at a time. Therefore it is recommended to use concurrent request processing whenever developing and running production services.

> __The Unicorn web server lets you run any Rails application concurrently by running multiple Ruby processes in a single dyno.__

In short, with Unicorn we can serve more requests with a single (free) dyno. So let's switch!

Add the unicorn gem to your Gemfile:

```
gem 'unicorn'
```

Unicorn needs a config file to run at it's best, create `config/unicorn.rb` and paste in the following config:

```
worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 15
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
```

The first line of the config is what we're most excited about: `worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)`. This option means our single dyno will able to serve up to three requests.

## CDN

Most production applications use two HTTP servers. An externally facing server that acts as the 'font door', often Nginx or Apache and the internal app server (in our case Unicorn).

The externally facing server's job is to handle all incoming requests, forwarding the dynamic requests to the app server(s) and responding to requests for static assets (e.g. JS, CSS & images). This approach allows us to free up the slower app servers by off-loading the requests for static assets to the much faster external web server (Nginx/Apache).

Taking this approach with Heroku isn't all that straightforward but we can get the same benefits (and more!) by serving our static assets with a CDN service like Cloudfront. The CDN will serve all our static assets and our app server won't have to lift a finger.

__Warning:__ Cloudfront is not free, but it's very inexpensive. Serving ~10GB of assets will cost under $2/month. Check the [price calculator](http://calculator.s3.amazonaws.com/index.html) for more details.

See this Heroku [doc](https://devcenter.heroku.com/articles/using-amazon-cloudfront-cdn) for all the details.

In short, once you setup Cloudfront to serve the assets for your domain you'll be given an asset host. Then you'll configure your app to use the Cloudfront domain as the host for assets:

```
# config/environments/production.rb
config.action_controller.asset_host = "<YOUR DISTRIBUTION SUBDOMAIN>.cloudfront.net"
```

Once everything is setup, browsers will be requesting assets from `<YOUR DISTRIBUTION SUBDOMAIN>.cloudfront.net`. On the first request Cloudfront won't have that file cached and it will as your app server for the asset. From then on your app server won't be bothered to serve that particular file, since Cloudfront will store a serve a copy.

CDNs like Cloudfront are obvious choices for things like CSS/JS & images. But CDNs can also be used for anything served over HTTP. For example if you have a slow JSON request you might memcache the work you perform server side to generate the JSON. But if the HTTP response isn't likely to change over a long time period, then consider caching the response at the HTTP layer with a CDN.

## Postgres Performance

The development Postgres database tier is free, but it's missing what is considered critical for a performant database -- an in memory cache. Every query is making a request our to disk, which is much slower than RAM.

Short of upgrading to a plan with an in memory cache the least we can do is keep an eye on our Postgres performance and make sure we're making the most of the database we have. [This post](http://www.craigkerstiens.com/2012/10/01/understanding-postgres-performance/) has a ton of useful commands to inspect the performance of your production database. You'll be able to answer questions like "What's my hit rate for indexes versus table scans?" and so much more.

## Memcache

Memcache is the defacto caching server for web apps. It can have dramatic effects on your app's performance. Support for memcache is built into Rails and Heroku offers a free memcache add-on called [Memcachier](https://addons.heroku.com/memcachier) (with 5MB of cache storage).

Great candidates for caching include anything that meets these criteria:
* Is the same for all or a 'large' group of users (e.g. top selling books or most commented posts)
* Doesn't need to be generated at the time of the request
* Fits within the limits of memcache (1MB)

Caching times don't need to be long to be effective. Imagine you're app receives 10/requests/second at peak. Even if you cache something (a slower database query, a complex template render, etc) for just 30 seconds means you'll only do that work once per minute, instead of 600 times a minute! This can really take a load off your database or app server when they need the most help.


## Validating Performance

There are plenty of tools that will help identify performance issues (from the clients perspective). Google's [PageSpeed Insights](https://developers.google.com/speed/pagespeed/insights/) is a great starting point.

Another useful tool is Yahoo's [YSlow](http://developer.yahoo.com/yslow/)

## Benchmarking

When dealing with performance issues, it can often be really difficult to pinpoint exactly which piece of code is causing a problem.  Sure you could just start guessing and fixing those things, but there must be a better way, right?  There is!  

A benchmark is the time it takes for a piece of code to run. Benchmarking is running these tests on your code to make sure something crazy doesn't happen.

Rails 3 came with the ability to write performance tests, but it was moved into its own gem in Rails 4: [Rails PerfTest](https://github.com/rails/rails-perftest).  To use this with Rspec, you'll need the [Rspec-Perf gem](https://github.com/sinisterchipmunk/rspec-prof)

Ruby also has a built in [Benchmark module](http://www.ruby-doc.org/stdlib-2.0/libdoc/benchmark/rdoc/Benchmark.html).

### Analytics

Related to benchmarking is monitoring and analytics, where you specify the information you want to store each time a piece of code runs.  [Keen.io](https://keen.io/) is a nice option with a [free Heroku add-on](https://addons.heroku.com/keen).

## New Relic

[New Relic](http://newrelic.com/) is a software-as-a-service performance monitoring for you application.  New Relic has a [free add-on for Heroku](https://addons.heroku.com/newrelic).



