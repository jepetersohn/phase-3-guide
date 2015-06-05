# Teaching Directions for Final Project

## Purpose

While we do our best to make our challenges focused, relevant, and fun, nothing
will prepare you for the real world like creating and implementing a project of
your own design.  It's an opportunity to focus on things that you never _quite_
got during your education here. It's also an opportunity to try how the
meta-learning you've grown in while here can help you learn new technologies.
It's a chance to share a passion and ask for help in realizing it.

This project is important.  It reflects the culmination of the last 18 weeks at
DBC.  Nevertheless, it is only a project, you should never feel compelled to
harm you health or well-being in the pursuit of this project.  Here are some
guidelines.

## What we're looking for

1.  We will evaluate the quality of your code in terms of the coverage that's
provided by your tests.  We will use the following tests to find vulnerable
areas and then we will beat up the vulnerable parts to try to find breaks.  We
will use the following tools:
  1.  [Flog](https://github.com/seattlerb/flog)
  1.  [Simplecov](https://github.com/colszowka/simplecov)
1.  Doing a front-end (mostly) app does not absolve you of testing.  If you
take this approach we expect to see Jasmine tests
1.  Simplicity
  1.  Templates
  1.  Controller methods (brief!)
  1.  Classes: SOLID
1.  Cross-team competence:  do not have a "testing guy" or a "front-end gal".
You team should be conversant on the **team's** code
* Proper use of ActiveRecord (esp. associations)
* MVC OO JS (where appropriate)

## What we want to provide

1.  Support for team leads (and team members!) to help keep interpersonal
conflict and friction at a minmum
1.  Tips in constructing and advancing your debugging process

## Specific Problems

* [N+1](http://guides.rubyonrails.org/active_record_querying.html#eager-loading-associations)

## Consultation

We will be available to consult with your team.  Have questions ready for us.
If you don't we will use those as free time to explore / mangle / flog your
code.  Friday and Tuesday will be consultation days.

## MVP

Will be presented on Monday and will be reviewed by the teachers on the same
day.

## Don't Deplete Your Hit Points

Use the Github Graphs Timecard graph.  It will show you when you're working.
You should have your "black dots" between reasonable time hours.  When you work
outside of reasonable hours you're throwing brute force at the problem. Don't
do this.  Ask better questions.  Focus your debuging, but don't sit there
plugging away at the same inefficient strategy.

## Don't Abuse Chemicals

I've overheard in several final projects that students were abusing Adderall to
get through the final project. In no circumstance should you follow this
technique.  If it's prescribed to you by a licensed medical pratcitioner, fine;
but you should not **ab**use pharmacology in the pursuit of your goals.

## Do Ask for Help When Interpersonal Conflict Is Unmanageable

Your instructors have seen projects encounter, survive, and move past
interpersonal worries.  Do not keep these concerns to yourself, reach out to
us.

## GETTING STARTED

1.  Create a repo underneath your cohort organization
2.  Create a README.md in said repo
3.  In the README provide:
  * Project name
  * Your names
  * Your Trello Board
  * Any working agreements
4. _Later..._ after ideation, provide the user stories which comprise your MVP
5. Set up Continuous Integration where applicable (CircleCI, Travis)
