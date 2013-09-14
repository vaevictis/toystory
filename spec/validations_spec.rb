require "toystory/version"
require_relative '../lib/validations'

class DummyClass
end

describe Validations do
  
  before(:each) do
    @dummy_class = DummyClass.new
    @dummy_class.extend(Validations)
  end
  
  describe "#validate_movement" do
    it "ensures the movement syntax is correct for simple moves" do
      @dummy_class.validate_movement('MOVE').should be_true
      @dummy_class.validate_movement('LEFT').should be_true
      @dummy_class.validate_movement('RIGHT').should be_true
      @dummy_class.validate_movement('REPORT').should be_true
    end
    
    it "ensures the movement syntax is correct for placement moves" do
       @dummy_class.validate_movement('PLACE 3,2,SOUTH').should be_true
    end
    
    it "ensures syntactically incorrect movements are caught" do
      @dummy_class.validate_movement('').should be_false
      @dummy_class.validate_movement('LOCOMOTE').should be_false
    end
    
    it "ensures moves that place movements outside the table are not executed" do
      @dummy_class.validate_movement('PLACE 5,5,SOUTH').should be_false
    end
  end
end
