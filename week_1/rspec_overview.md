## Rspec Overview

### General Testing
- __TDD__
Test Driven Development. Write examples before implementation.
- __BDD__
Behaviour-Driven Development is about implementing an application by describing its behavior from the perspective of its stakeholders. ([The Rspec Book](http://pragprog.com/book/achbd/the-rspec-book))
- __RSpec__
(mention alternatives, write a simple hand sewn test)

### Testing Terms
#### Structure of an example (test)
- __Code Example__
An executable example of how the subject code can be used and its expected behavior. Also called a test, calling tests code examples reinforces the documentation value of RSpec tests.
- __Example Group__
defined with the 'describe' method, pass it a string, which is what we'll be describing, this reinforces the idea that Rspec is used to describe and document a system. 
- __It__
A block which defines a code example

#### Test Implementation
- __Expectations__
A requirement for any test. In code examples we set expectations of what should happen. If the expectations aren't met, the test fails.

```ruby
expect(user.active).to be_true
expect(user.favorites).to include("Ramen")
```

- __Mocks/Doubles/Stubs__
All the same thing. A test double is an object that stands in for another object in an example (test)

```ruby
user = mock(:user)
user = double(:user)
```

- __Message Stubs__
Returning a predefined response to a message within a code example

```ruby
user.stub(:name).and_return("Bobby McFerrin")
user.stub(:name => "Bobby McGee")
user = mock(:user, :name => "Bobby McFerrin")
```

- __Chaining Stubs__
Sometimes you need to stub deep (watch out for this, it's a bad code smell). `stub_chain` can help:

```ruby
user.stub_chain(:account, :billing_address).and_return("717 California St.")
user.account.billing_address # 717 California St.
```

- __Message Expectations__
A method stub that will raise an error if it is never called.

```ruby
user.should_receive(:name).and_return("Bobby McFerrin")
``` 

## Running Tests
#### Default rspec output is lame. Make it pretty

  rspec --color --format documentation some_spec.rb

Better yet, save this to your ~/.rspec config file:

  echo "--color --format documentation" > ~/.rspec
  
#### RSpec with Rails
Add `rspec-rails` to your Gemfile, `bundle install` then `rails generate rspec:install`. Use `rake spec` to run tests.

## FAQ
**Can you TDD when practicing BDD?**

Sure. You'll have to circles of Red/Green development. The outer circle, (BDD) and the inner circle (unit testing).

**Benefits of TDD**

- Smaller (shorter) development cycle. Focus on developing and delivering the smallest unit of value (just like your commits!)
- Avoid over engineering by writing the simplest code that passes the test when practicing TDD. This discourages you from including rainy day code you might never use.
Develop the interface free of any implementation

## To Read Next

- [Quick example of how Rspec is used to test code](./basic_rspec.md)
- [Rspec Best Practices](./rspec_best_practices.md)

## Resources


- [Here’s a quick example of how Rspec is used to test code](https://gist.github.com/abinoda/1a0778292dd0aa0cd380).
- Please [Explore Rspec syntax](https://www.relishapp.com/rspec/). In particular, try to familiarize yourself with the basic structure of rspec, hooks, subject, built-in matchers, custom matchers, mocks, and rspec with rails. You'll find documentation on each of these topics.
- Study [this app and test example](https://github.com/Devbootcamp/awesomebits). This code base was developed by Thoughbot, they are the creators of 2 popular gems used in testing ([shoulda](https://github.com/thoughtbot/shoulda) and [factory girl](https://github.com/thoughtbot/factory_girl_rails)). It's a good place to see how the creator of the gems intended to use them.
- [Testing with Rspec](https://www.codeschool.com/courses/testing-with-rspec)
- [Rails testing for zombies](https://www.codeschool.com/courses/rails-testing-for-zombies)
- [Request Specs and Capybara](http://railscasts.com/episodes/257-request-specs-and-capybara)
- [How I Test](http://railscasts.com/episodes/275-how-i-test)
- [Rspec Cheat Sheet](http://cheat.errtheblog.com/s/rspec)
- [Rails/Rspec example code](https://github.com/awesomefoundation/awesomebits/tree/master/spec)

```ruby
1000.times { puts "please do not copy and paste, you'll be hurting yourself." }
```
