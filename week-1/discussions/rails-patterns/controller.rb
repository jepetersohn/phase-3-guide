# The controller is the brain, it receives web requests, does the job to fullfil the request and responds back with the results.
# The controller should be as thin as possible, meaning, it's main job is to delegate work to models and views rather than doing the job itself. In Rails, you'll often hear: "thin controllers, fat models". While, fat models could become problematic, we won't deal with this here. As a first pass, most of your logic will happen in the model.
# Alright, let's look at some examples:

class PostsController << ApplicationController
  def index
    # bad
    # The controller now is doing too much and knows too much about the Post model.
    @posts = Post.all
    @posts = @posts.select &:published
    # good
    # create a class method on Post model called published that does the work behidn the scenes.
    @posts = Post.published
    # This line of code should make you uncomfortable. It doesn't belong here, but it doesn't also translate perfectly into a simple method on the model like we did above. If logic like this in the controller makes you feel uncomfortable and gives you nightmares, then I did my job :)
    # We have to differeciate between code smells and strategies to refactor code. Detecting codes smells is the hardest part, you need to train your nose to smell it...mmm that smells bad. What to do about it is a different problem.
    @posts.map! { |post| post.title.gsub('-', ' ') }
    # better strategies:
    # 1- We can remove all - from titles before we save to the database (this will happen on a before_save callback on the model)
    # 2- If, for some reason, you don't want to remove the dashes from a title on save. We can create a method in the model called (formatted_title or title_no_dashes or sweet_title ;) ). We can then use that inside the published method and have it return what we want.
    # 3- If we want to keep our publish method flexible to use dashes or not, then we can make it take a flag or create a custom method on top of it.

    # if we do any the above, our index action will be 1 line of code and all it does is delegate a call to the Post model...Nice!

  end

  def create
    @post = Post.new params[:post]
    # lines 29 and 30 smell bad. They are dipping inside the post and doing work that should be handled by the model.

    # The model should take care of it's own. If we want to store the titles downcased, then the model should take care of that in a before_save callback.
    @post.title = @post.title.downcase # bonus: what's the difference between downcase and downcase!, why aren't we using donwcase! ?

    # The model should take care of it's own. If we want to store the dates in a specific format, then the model should take care of that in a before_save callback.

    # bonus: what's the difference between before_save and before_create ?
    @post.published_date = params[:post][:date].strftime("at %I:%M%p")
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end
end

