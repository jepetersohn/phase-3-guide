# Microchallenge: Memcached

## Overview

Memcached is a popular memory caching system commonly used for speeding up web applications.

In this microchallenge you'll be working with the same person you've been pairing with today to implement Memcached locally in your Karmaville applications.

## Challenge

Start by pulling down one of your DBC codebases and setting up memcached locally using the [Dalli memcached client](https://github.com/mperham/dalli). This might be a little bit difficult. #DealWithIt (hint: read the docs, ask your friends, google, stack overflow, find code examples)

Verify your Memcached/Dalli setup by booting up Rails console and typing:

```ruby
Rails.cache.write "foo", "bar"
```

which should return ``true``, and then:

```ruby
Rails.cache.read "foo"
```

which should return the value "bar"

All the while, your Memcached server should be returning output in terminal after each command.

Once you've got Memcached configured, implement caching in your application:
1) Cache your most expensive database query so that its result is returned from memory instead of disk
2) Cache a view block or partial that generates SQL queries (eg. comments) so that its output is pulled from memory instead of being regenerated every time

Here are some methods you'll probably use:

```ruby
Rails.cache.write "foo", "bar"
Rails.cache.read "foo"
Rails.cache.fetch do ... end
```

Your caching strategy should address invalidation / expiration.

Remember what I said earlier today -- the hard part isn't knowing *how* to optimize. The challenge is knowing *what* and *when* to optimize.

For extra-credit: setup Memcached on Heroku
