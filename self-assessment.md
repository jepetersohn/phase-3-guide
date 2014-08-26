# Assessment

Hello, this is an assessment.  While some might use the word "pop quiz" to
describe it, we prefer to think of it as an opportunity for you to
spontaneously demonstrate your competenencies.

The material should be quite familiar to you at this point.

## One:  Paging Dr. Zhivago

You have a Doctor `Active Record` class which has many `Patients` through
`Appointments`. Bob the patient schedules an appointment with Doctor Zhivago.
The code below has already run. What one line can you run to schedule an
appointment?

```ruby
zhivago = Doctor.find_by_last_name "Zhivago"
bob = Patient.new "Bob"
# What one line can you run to schedule an appointment?
```

BONUS:  Can you create a new patient named "Pasternak" who belongs to Dr.
Zhivago in one line?

## Two:  Instruments

A `Doctor` has many Specialties (model class `Specialty`).  When updating his
profile on Revolution-book, the premier social network of pre-Bolshevik
society, Dr.  Zhivago sends a request that looks like the following:

```ruby
params = {:specialties=>[{:name=>"Prussian Flu"}, {:name=>"Viennese Mumps"}]}
```

```ruby
zhivago = Doctor.find_by_last_name "Zhivago"
# What one line can you run to create multiple specialties for the doctor?
```

BONUS:  What HTTP protocol should have been used in this interaction?

## Three:  JavaScript

Wombat Dave told Dr. Zhivago that JavaScript is the bomb.  While practicing to
get the hang of things, Dr. Zhivago thought a worthy challenge would be to
create a simple JavaScript class called `Greeter`.  An instance of `Greeter`
can be initialized with a name.  Invoking `say_hello` on that instance should
use `console.log()` to print out "Hello" to the initialized name.

Dr. Zhivago wants to make his Greeter say hello to his beloved Lara.  Please
write the implementation.

BONUS:  What's bad form about calling the method `say_hello`?

## Four:  REST

While imprisoned by the revolution Dr. Zhivago dreamt of his beloved Lara and
of RESTful routes.  But in his dream he could not complete this chart.  Please
help him.

4\.
The chart below describes RESTful routes, but is incomplete:

HTTP Verb | Path              | Action  | Used for
--------- | ----------------- | ------- | --------
GET       | /photos           | **1**   | display a list of all photos
GET       | /photos/new       | **2**   | return an HTML form for creating a new photo
POST      | **3**             | create  | create a new photo
GET       | **4**             | show    | display a specific photo
GET       | **5**             | edit    | return an HTML form for editing a photo
PATCH/PUT | **6**             | update  | update a specific photo
DELETE    | /photos/:id       | **7**   | delete a specific photo

List the missing path or action below:

1.  
2.  
3.  
4.  
5.  
6.  
7.  

## Five:  After

After escaping his tormentors, Dr. Zhivago moves to Los Angeles to become a
plastic surgeon to the rich and famous.  He wants to get a list of his new
patients.  He is the third doctor in our system

Given:

```javascript
$.ajax({
  type: 'GET',
  url: '/doctors/3/patients'
});
```

Write an implementation that displays the patients.

Option 1:  Print it to the console.

Pro-Version:  Add the names to  `<div id="patients">`.

## Six:  Loneliness Strikes

Dr. Zhivago, now living next to the "Shahs of Sunset" misses his old friends in
Russia.  He wants to find a lovely lady (`sex`), located in russia (`country`)
whose age (`age`) is between 40 and 50, who has an (`iq`) greater than 200.  Can
you use the advanced `AREL` `ActiveRecord` syntax to help the good doctor find
friendship?

As a starter.... `Friend.where....`

