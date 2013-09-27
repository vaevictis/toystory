require_relative '../lib/validations'

class DummyClass
end

describe Validations do
  
  before(:each) do
    @dummy_class = DummyClass.new
    @dummy_class.extend(Validations)
  end
  
  describe "#valid_syntax" do
    it "ensures the movement syntax is correct for simple moves" do
      @dummy_class.valid_syntax('MOVE').should be_true
      @dummy_class.valid_syntax('LEFT').should be_true
      @dummy_class.valid_syntax('RIGHT').should be_true
      @dummy_class.valid_syntax('REPORT').should be_true
    end
    
    it "ensures the movement syntax is correct for placement moves" do
       @dummy_class.valid_syntax('PLACE 3,2,SOUTH').should be_true
    end
    
    it "ensures the placement moves take into account table size" do
      
       @dummy_class.valid_syntax('PLACE 7,7,SOUTH', 9).should be_true
    end
    
    it "ensures syntactically incorrect movements are caught" do
      @dummy_class.valid_syntax('').should be_false
      @dummy_class.valid_syntax('RANDOM').should be_false
    end
    
    it "ensures moves that place movements outside the table are not executed" do
      @dummy_class.valid_syntax('PLACE 9,9,SOUTH').should be_false
    end
  end
  
  describe "#safe_move" do
    
    before(:each) do
      @table = double('table').as_null_object
      @table.stub(:size) {5}
      
      @hal = Robot.new(@table)
    end
    
    it 'ensures that a robot on the side of the table cannot move out of it' do
      @hal.x           = 4
      @hal.y           = 2
      @hal.orientation = 'EAST'
      @hal.placed      = true

      @hal.safe_move('MOVE').should be_false
    end
  end
end
