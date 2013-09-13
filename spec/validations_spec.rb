require "toystory/version"
require_relative '../lib/validations.rb'

class DummyClass
end

describe Validations do
  
  before(:each) do
    @dummy_class = DummyClass.new
    @dummy_class.extend(Validations)
  end
  
  describe "validate_movement" do
    it "should ensure the movement syntax is correct" do
      @dummy_class.validate_movement('MOVE').should be_true
    end
  end
end
