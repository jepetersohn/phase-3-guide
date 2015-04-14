# Agile Workflow

* History
 * Historically long projects, and long software projects followed NASA and DARPA:
   * Ideation  
   * Requirement Gathering  
   * Implementation  
   * Testing / QA  
   * Release  
 * Each phase was "idle" until the previous phase was complete
 * Agile, enabled by new technology (cheaper CPUs, more powerful CPUs, more flexible programming languages) was able to integrate *vertically* and create end-to-end features
 
* Agile Religion
  * There are many "flavors" of agile, just like `git` workflows.  Your employer / team may use a different flow than what we have taught you here, it's no big deal
  * Ideation
   * The client comes in and establishes _n_-many **user stories**
   * The developer team them assigns "**points**" to each story in a process called **estimation**.
    * Many use a Fibonacci sequence (1, 3, 5, 8) where:
      * `1`: I can do this before lunch
      * `3`: I can do this before lunch, but might bleed over
      * `5`: I can do this today, but we've not gotten the implicit "sub-stories" broken down
      * `8`: This story should be broken down, or it's quite difficult (and _risky_)
 * All stories enter an **icebox**.  The team lead will dictate how many **points** a team can perform in a week.
 * The client / team will build together enough stories to use up the available **points**
   * Clients will want more points: "Do you want to pay for more developers?"  "No."  "Then these are what you get."
   * Clients will want bugfixes AND features:  See above.
 * Derive a **release** and plan to deliver it at the end of the work week
 * Standups
  * Every `$PERIOD_OF_TIME_THAT_MAKES_SENSE` you should have a stand-up.  Each member answers 3 questions:
   1.  What did you do in the previous period of time?
   2.  What will you do in the next period of time?
   3.  Do you have any blockers? (need the CEO's credit card, students set my computer on fire, etc.)
* Retros
 1.  At the end of a release you shoud have a demo for the client and get feedback
 2.  Use feedback to drive new user stories and repeat the process
 3.  The team should have a retro
  * What did we do that helped us accelerate our velocity
  * What happened that hindered our velocity
  * Kudos
* Rinse / Wash / Repeat
* Tracking Work
 * Many use Trello to manage 1 user story to 1 card.  Developers should only be working on 1 card at a time
 * Cards move through various lanes (WIP, Complete, Validated, Signed-off) to completion _before_ a developer takes another card

* Professional Development Rules
  * Do all your work in a feature branch
  * Submit requests to have a **peer** merge your code
  * When reviewing code ask "Is this clear, is this simple, is this understandable"
  * Use Github inline comments to indicate areas for improvement
  * Make improvements on your feature branch and then push it back _to the same branch_ on github. The PR will automatically-update
  * Testing
    * You should write tests that exercise your application
    * Continuous Integration can run your tests for you based on each merge to master. Investigate Travis CI or Circle CI
