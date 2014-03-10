# Git With It

### Part 1

Pretend you've inherited a new project for a company who's developer has gone 
AWOL. You visit the project's Github repo and discover an outstanding pull 
request -- you decide to dive into the project by starting there. Take a look 
at https://github.com/foxes-2014/git-with-it/pull/1. Fork the repo and pull 
down the feature branch locally.

##### Viewing history
Type in `git log` to view the git history.

Notice that there are is only one feature commit… hmm… seems fishy. I wonder 
if they pulled a no-no and committed a bunch of unrelated work in one 
mega-commit. God damnit, Ryan hates it when this happens!

Recommended: read more about `git log` at http://git-scm.com/book/en/Git-Basics-Viewing-the-Commit-History

##### Viewing changes
Cool it… don't get ahead of yourself. Let's actually take a look at the 
last commit to see if it's bad. [Do research](http://git-scm.com/docs/git-diff) 
on the `git diff` command and create a diff displaying the changes between the 
previous two commits (HINT: you'll need the commit refs from `git log`). Take a 
screenshot of the diff and show it to your instructor to verify you've done it 
correctly. On a related note, in this case you could also examine the previous 
commit using the command `git show HEAD^`.

Extra Credit: Produce a diff that displays only a list of changed files

##### Rolling back
The last commit is a terrible one -- it consists of a bunch of unrelated 
changes bundled by a single, poorly explained message. Let's fix this mess. We 
first need to rollback one commit so we can re-commit the changes properly. But 
before we touch anything, let's checkout a new branch to work within. Research 
`git reset` (I recommend the thread on [StackOverflow](http://stackoverflow.com/questions/2530060/can-you-explain-what-git-reset-does-in-plain-english)) 
and then roll back the latest commit **without deleting files** (HINT: be soft).

Type `git status` to see all the changes on our plate. Our goal is to re-commit 
these changes in smaller, meaningful chunks.

##### Unstaging
Take a look at the results of `git status` again. Notice the files under where 
it says `Changes to be committed:`. We don't want that! We don't want to commit 
all those changes in one batch! Let's unstage the changes by typing 
`git reset HEAD`. Verify that the changes have been unstaged by typing 
`git status` again.

##### Commiting partial hunks
Now we are ready to incrementally stage and commit the changes. We want to 
split up changes into five separate commits (in the order listed):

- "dont render layout if ajax"
- "added controller method to render 404s"
- "added comments controller, model, and routes"
- "added posts controller, model, and routes"
- "added posts helper"

Your job is to selectively stage changes and commit them as outlined above.

We'll need to use `git add -p` to [stage partial hunks](http://blog.bignerdranch.com/1579-using-git-hunks/) 
of the routes file and application controller in order to split them up into 
separate commits. Type `?` for a list of command descriptions (HINT: you may 
need to manually edit hunks).

If you mess up you can always use `git reset` as we did earlier to roll back a 
commit or unstage changes. If you totally mess up everything, you can always 
checkout a fresh posts_and_comments branch and create a new feature branch (yay 
feature branches!).

Once you're done, use `git log` and `git diff` to verify your results and check 
in with an instructor.

### Part 2

##### Rewriting history

Ryan has OCD and wants his git history to be very neat and expressive. We 
wants you to:

1. Squash "added posts helper" and "added posts controller, model, and routes" 
into a single commit, and amend the message to "added posts controller, model, 
helper, and routes"
2. Reorder commits; I want to move the comments commit after the posts commit 
since comments is dependent on posts.

You'll accomplish both of these todos by using `rebase`. Please consult 
http://git-scm.com/book/ch6-4.html to learn about rewriting history.

HINT: You'll do something like `git rebase -i HEAD~3`...

##### Integrating upstream changes

Chips, ahoy! While you've been working all this time, Ryan's been working on 
some changes that are sitting on a feature branch. Let's assume you'd like to 
pull down my changes so you can integrate them in your feature branch. You have 
two options for how to do this:

*this is the equivalent of git fetch and then git rebase:*

`git pull --rebase origin helper_methods`

*this is the equivalent of git fetch and then git merge:*

`git pull origin helper_methods`

The key here is the difference between rebase and merge. It's important to 
understand the difference between merging and rebasing. I recomend reading 
[Rebase vs Merge](http://gitguru.com/2009/02/03/rebase-v-merge-in-git/) and 
[A Git Workflow For Agile Teams](http://reinh.com/blog/2009/03/02/a-git-workflow-for-agile-teams.html).

After doing some reading, you should have come to the conclusion that rebasing 
is the right option here (if you don't understand why, study those articles 
and/or ask someone to explain it to you). After rebasing the changes from the 
helper_methods branch, your code should contain some new helper methods inside 
your application helper file. Yay!

##### Wrapping up
We recommend that you read [What a Branch Is](http://git-scm.com/book/en/Git-Branching-What-a-Branch-Is) 
for an awesome deep dive into how Git stores data and branches.

Now that you're a world-class Git beginner, it's time to share your work with 
the foxes-2014 org! Push up your feature branch to your forked repo and submit 
a pull request for your instructor to review.