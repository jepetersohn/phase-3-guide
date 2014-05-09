1- Create a capybara_helpers.rb file under spec/support folder (create the folder if it's not there). Add this code to the file.
```ruby
module CapybaraHelpers
  def wait_for_ajax_to_finish
    page.document.synchronize do
      raise AjaxStillWorking unless page.evaluate_script('jQuery.active == 0')
    end
  end
end

class AjaxStillWorking < Capybara::ElementNotFound;end
```

2- Include the module in spec_helper.rb: inside the Rspec.config block
```ruby
RSpec.configure do |config|
  config.include CapybaraHelpers

  #... the rest of the config code
end
```


