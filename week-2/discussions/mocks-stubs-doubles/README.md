## mocks, stubs and doubles

The terms/concepts of mocks, stubs and doubles mean different things depending on the context. To understand the difference in a classical TDD, read this [awesome article](http://martinfowler.com/articles/mocksArentStubs.html) by Martin Fawler.

In the BDD and Rspec world, this is what they mean:

###Doubles
Are Fake objects. They have a name (the name is just a name, it knows nothing about the object you're attempting to fake). They only know how to respond to messages (methods) that you define on them. In Rspec 2, [this](https://relishapp.com/rspec/rspec-mocks/v/2-14/docs/) how you create them. In Rspec 3, you'll be able to verify that your mock did not divert from the original object, but using instance_double, like [so](https://relishapp.com/rspec/rspec-mocks/v/3-0/docs/)

###Stubs
Are fake method calls. In the olden Rspec versions you were able to create a double by using stub(:my_object), which sucked. Now that's depricated and stub is used to fake a method call and return what you want. You can fake a method call on a fake object (double) or an actual object.

###Mocks
Are fake method calls with expectations. Basically, fake the method but also make sure it was called. In the olden Rspec versions you were able to create a double by using mock(:my_object), which sucked. Now there is mock method, to create a mock you do this:

```ruby
SomeObject.should_recieve(:some_method) { #this is the return value }
```
