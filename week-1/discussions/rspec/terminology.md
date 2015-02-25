# Definitions

## General Testing

### __TDD__

Test Driven Development. Write examples before implementation.

### __BDD__

Behaviour-Driven Development is about implementing an application by describing
its behavior from the perspective of its stakeholders.

The preceeding are testing _approaches_ they _are not_ technologies.  In the
same way Rails is a "web application stack" RSpec is a technology that conforms
to the BDD paradigm.  BDD is a TDD sub-specification, so RSpec can be fully
understood as a Ruby-based TDD / BDD framework for appliation construction.

## Testing Technologies

### Hand-Written

You intuitively have been using this approach.  It's the same approach that
toddlers use to learn about their world (much to their parents' chagrin).
If you look back at [roman-numeral-challenge](../../../../roman-numerals-challenge/blob/master/source/roman_numerals_spec.rb).

### MiniTest / Test::Unit

One popular testing framework is `MiniTest` or its predecessor `Test::Unit`.
It's more primitive (might be a feature?) than RSpec, but is the default that
ships with Ruby and Rails.  In order to avoid MiniTest's installation in a
Rails program, invoke rails with `rails new my_project -T`.  The `rails --help`
documentation can help you understand the `-T` flag in more detail.

### RSpec

This is the testing framework we use at DBC.  It must be installed as a Gem in
a new Rails project.  RSpec has a particular language associated with it e.g.
`expect`, `it`, and `describe`.  Some consider this requirement that you learn
another "custom" language when you're already writing in a "custom" language to
be a bad thing (might be a feature?)

### RSpec Testing Terms

#### Structure of an example (test)

#####  Code Example

An executable example of how the subject code can be used and its expected
behavior. Also called a test, calling tests code examples reinforces the
documentation value of RSpec tests.

#### Example Group

An example group is defined with the 'describe' method, pass it a string, which
is what we'll be describing, this reinforces the idea that Rspec is used to
describe and document a system.

#### It

A block which defines a code example

For further explanation of RSpec syntax, please purchase Aaron Sumner's
Everyday Rails: Testing with RSpec


### Test Implementation

#### Expectations

`expect` is the heart of RSpec.  A basic assertion is:

    expect(2 + 2).to eq 4

or

    expect(Gene.loves("Jezebel")).to be_true

The `be_true` or `to eq` are called "matchers."  Consult RSpect documentation
for more information on matchers


#### Mocks/Doubles/Stubs

All the same thing. A test double is an object that stands in for another object in an example (test)

		user = mock(:user)
		user = double(:user)
		user = stub(:user)

The advantage of a double is that you don't incur the overhead of creating
database rows.

#### Message Stubs

Returning a predefined response to a message within a code example

		user.stub(:name).and_return("Bobby McFerrin")
		user.stub(:name => "Bobby McGee")
		user = mock(:user, :name => "Bobby McFerrin")

- __Chaining Stubs__

Sometimes you need to stub deep (watch out for this, it's a bad code smell). `stub_chain` can help:

		user.stub_chain(:account, :billing_address).and_return("717 California St.")
		user.account.billing_address # 717 California St.

- __Expectations__

A method stub that will raise an error if it is never called.

	user.should_receive(:name).and_return("Bobby McFerrin")

# FAQ

#### Can you TDD when practicing BDD?

Sure. You'll have two circles of Red/Green development. The outer circle, (BDD) and the inner circle (unit testing).

#### Benefits of TDD

- Smaller (shorter) development cycle. Focus on developing and delivering the
  smallest unit of value (just like your commits!)
- Avoid over-engineering by writing the simplest code that passes the test when
  practicing TDD. This discourages you from including rainy day code you might
  never use.
- Develop the interface free of any implementation

# Running Thangs

#### Default rspec output is lame. Make it pretty

	rspec --color --format documentation some_spec.rb

Better yet, save this to your ~/.rspec config file:

	echo "--color --format documentation" > ~/.rspec

_Do you know what the shell echo command does?  Own your learning and find
out!_

#### RSpec with Rails

Add `rspec-rails` to your Gemfile, `bundle install` then `rails generate rspec:install`

[Sumner]: https://leanpub.com/everydayrailsrspec
