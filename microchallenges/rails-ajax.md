# Microchallenge: Rails and AJAX

## Overview

This micro-challenge will help reinforce your understanding of using AJAX with Rails. In order to attempt this challenge you'll need at least one form (post) and one get request to AJAXify.

There are actually 2 ways to use AJAX with Rails and we will try both.

Begin each challenge by creating a new feature branch of the app you started building today (or any other app you've built). Name the branch whatever you'd like because we'll be throwing it away once we're done with this challenge.

Consider:
- How will you handle invalid input or errors?
- Do you want the server to return json or html?

## Challenge 1: remote: true

Use the Rails form helper `remote: true` method.

### Release 1

Use ajax for the get request.  Insert the response into the DOM.

### Release 2

AJAXIFY the form.  Send the form data to the server and send back a success or error.



## Challenge 2: jQuery AJAX

For these releases, you will use good old jQuery &mdash; just like you did in Phase 2 with Sinatra!

Easy Peasy! Right?

Well ... Rails, for security reasons, makes this a little harder for us.

Research Rails, jQuery, and csrf.

*hint: there is more than one way to do this.  Look into setRequestHeader, ajax.setUp and beforeSend and try each one out!*

### Release 1

Use ajax for the get request.  Insert the response into the DOM.

AJAXIFY the form

### Release 2

 the form.  Send the form data to the server and send back a success or error.

