# Our User model now handle Github API calls. This type of logic bloats the User model. There are multiple ways we can solve this problem:
# 1. Move the github API calls into a module under lib/github.rb and mix it into the User model.
# 2. Move the the github API calls into its own class under models/github.rb (it won't inherit from ActiveRecord::Base) and use it in the User model.
# The difference between both approaches:
# module: we moved code out of our site, but it still indirectly exist in the User model by mixing it in.
# class: we really moved all of the github code and encapsulated it into its own class. However, we now have to instantiate it and delegate all api calls to it.
# Each decision has its own tradeoffs, try both and get a sense of how they work, then read and form your opinion.
# The biggest upside of both approaches is that we can easily test the api in isolation and we can swap/change the implementation without having to dip too much in the User model.
class User
  def github_feed
    # API call to get the user's github feed
  end
  def github_profile
    # API call to get the user's github profile
  end
  def github_repos
    # API call to get the user's github repos
  end
end

# Example:

# 1. using a module
module Github
  def github_feed
    # API call to get the user's github feed
  end
  def github_profile
    # API call to get the user's github profile
  end
  def github_repos
    # API call to get the user's github repos
  end
end

class User
  include Github
end

# 2. using a class
class Github
  def initialize username
    @username = username
  end
  def feed
    # API call to get the user's github feed
  end
  def profile
    # API call to get the user's github profile
  end
  def repos
    # API call to get the user's github repos
  end
end

class User
  delegate :github_feed, :github_profile, :github_repos, :to => :github
  def github
    Github.new(self.username)
  end
end
