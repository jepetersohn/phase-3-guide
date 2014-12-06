## Phase 3 Github Workflow

- Setup [global_gitignore](https://help.github.com/articles/ignoring-files). Make sure you ignore `database.yml` file and log files.
- Clone the challenge repo.
- Create your own branch (github usernames separated by dashes) e.g. shadi-topher
- Your work should happen in a series of small and concise commit messages. Basically, your solution shouldn't be a 1 gigantic commit.
- Continuously push your branch to github.
- When you're satisfied with your solution, submit a pull request.
- We never ever ever push to master, like ever.
- We never ever ever submit a pull request with failing tests, like ever.
- All group projects must have [Travis CI](https://travis-ci.org/) or [Circle CI](https://circleci.com) set up.

Here's a typical (ideal) workflow:

1. git checkout -b my_feature
2. Work
  1.  [Spike][]: a timeboxed investigation
  2.  Test
  3.  Write a Test-driven implementation
  4.  Commit
    1.  Commits should have a subject line (fewer than 50 characters in length)
    2.  After the "subject line" there should be a blank line
    3.  After the blank line you should include a description of what happens
        in the code
2. `git checkout master`
3. `git pull`
4. `git checkout my_feature`
5. `git rebase master`
6. `git push origin my_feature`
7. `git checkout master`
8. `git pull`
9. [Start back at 1](http://youtu.be/rXPfovXw2tw)

## Important Notes

* Nowhere do you type `git merge`
* Merging happens _via GitHub_.
