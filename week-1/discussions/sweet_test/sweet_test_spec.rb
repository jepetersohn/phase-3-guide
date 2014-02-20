require_relative 'sweet_test'
class Awesome
  attr_accessor :ness
  def initialize
    @ness = 0
  end
  def hello name
    name
  end
  def ness_up
    self.ness += 1
  end
end

describe Awesome do
  describe "#ness" do
    it "is inititalized with zero" do
      awesome = Awesome.new
      expect(awesome.ness).to.eq(0)
      expect(awesome.ness).to_not.eq(3)
    end
  end

  describe "#hello" do
    it "it raises an Argument error if no name is given" do
      awesome = Awesome.new
      expect { awesome.hello }.to.raise_error(ArgumentError)
    end
  end

  describe "#ness_up" do
    it "increments the ness" do
      awesome = Awesome.new
      expect { awesome.ness_up }.to.change { awesome.ness }
    end
  end
end
