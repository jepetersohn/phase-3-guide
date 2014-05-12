# Group Project Process

* Follow the [Git workflow](../git-workflow.md)
	* **Every** pull request must be reviewed by someone who did not write the code
	* Code Reviewer merges the Pull Request
	* Commits that include views must include screenshot(s) 
* Daily stand-ups
* Retros every other day
	* list the actions + person assigned from each retro in the wiki or README of your project 
* Use trello for user story list with:
	* current, backlog, ice box, and done boards
	* all stories estimated
	* all stories prioritized
	* current stories are assigned to the team member(s) working on them
	* list a link to your (public) trello board in your project's README
* [Wireframe](./wireframing.md) your webite before writing code
* Follow code styleguides:
	* [AirBnB Ruby Styleguide](https://github.com/airbnb/ruby)
	* [AirBnB JavaScript Styleguide](https://github.com/airbnb/javascript)
* 80% (or more!) test coverage - use [simplecov](https://www.ruby-toolbox.com/projects/simplecov) to get percentage
* Continuous Integration with [Travis CI](https://travis-ci.org/)
* Deployed to Heroku
* Follow the [bug report](./bug_reports.md] guidelines

## Demos

Prior to demos (MVP or final), you should:

- deploy to heroku
- add links to github, heroku, and trello to the wiki
- set up travis ci and add link to it on the wiki *(only for final demo)*

Group Project Demos should include:

- description of the project and what problems it solves
- demo of the the app and the functionality *from heroku*
- show simplecov test coverage
- each member goes around and talks about what they worked on and any challenges (technical or not) they faced, including showing code *(this will not happen in the final project)*
- discussion of the agile/team practices used -- trello, stand-ups, retros, estimation, TDD, CI, deployment etc
