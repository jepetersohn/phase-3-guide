require 'spec_helper'
describe "Homepage", :js => true do
  it "says hello" do
    visit root_path
    expect(page).to have_content("hello")
  end
end
