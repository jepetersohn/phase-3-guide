# all of this code needs crazy refactoring, make it better :)

def link_to name, url, options={}
  klass, id = options.delete(:class), options.delete(:id)
  data = options_to_data_attributes options
  "<a href='#{url}' class='#{klass}' id='#{id}' #{data}>#{name}</a>"
end

def form_for object, options={}, &block
  raise("you need a block") unless block_given?
  name = object.name.downcase
  method, url =
    if object.persisted?
      ["PUT", "/#{name}s/#{object.id}"]
    else
      ["POST", "/#{name}s"]
    end
  data = options_to_data_attributes options
  form_html url, method, data, &block
end


def form_html url, method, data
  open = "<form url='#{url}' method='#{method}' #{data}>"
  fields = yield
  close = '/<form>'
  "#{open}#{fields}#{close}"
end

def options_to_data_attributes options
  options.map { |key, value| "data-#{key}=#{value}"}.join(" ")
end



link_to "google", 'http:://google.com', :class => 'myclass', :id => 'eyed', :remote => true

@user = User.new
form_for @user, :remote => true do
  '<input type="text" name="username">' +
  '<input type="submit">'
end
