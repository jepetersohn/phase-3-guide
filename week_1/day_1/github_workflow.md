# Git Workflow

The basic workflow looks like:

1. Pull to update your local master
2. Check out a feature branch
3. Do work in your feature branch, committing early and often, and maintaining a "WIP" pull request on Github
4. Rebase frequently to incorporate upstream changes on master
5. When you're done with your feature, interactive rebase and squash your commits
6. Force push your cleaned up branch to Github to have it reviewed and merged

Here it is in more detail:

1. Before starting to work on your feature, checkout the master branch of the pository and update it using the `git pull` command

2. Create a new feature branch using the command `git checkout -b my_feature`. Or, if you want to work on an existing remote branch, create a local copy using the command `git fetch origin` and then `git checkout -b branch_name origin/branch_name`

3. Now that you've created your feature branch, you can make and commit changes. It's good practice to push this branch to Github ASAP and open a pull request prefixed with the title "WIP:" to signify that it is a work-in-progress and shouldn't be merged. This is a good habit that ensures you're creating a remote backup of your work, and gives other developers on your team visibility to see what you're working on.

4. At any point while you are developing, you can sync up your branch with the latest code from master by rebasing: `git pull --rebase origin master`

5. When you are ready to have your pull request reviewed for merge, cleanup your commit history by rebasing and remove the "WIP:" prefix from the title of your pull request. After rebasing your feature branch, you will most likely have to force push using the command `git push origin my_feature -f`. Make sure your pull request is descriptive so that the person reviewing your code understands what they are dealing with. 

6. If your pull request cannot be automatically merged, you need to rebase master into your feature branch using the command `git pull --rebase origin master`, resolve conflicts, and then push it up to Github. You should then be able to merge the pull request.

### Additional resources:
- [A Git Workflow for Agile Teams](http://reinh.com/blog/2009/03/02/a-git-workflow-for-agile-teams.html)
 