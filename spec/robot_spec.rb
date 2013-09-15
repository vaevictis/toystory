require_relative '../lib/robot'
require_relative '../lib/validations'


describe Robot do
  before(:each) do
    @eve = Robot.new
  end
  
  describe "#report" do
    it "reports the robot position when not placed yet" do
      @eve.report.should == "NOT placed"
    end
    
    it "reports the robot position when placed" do
      @eve.x           = 1
      @eve.y           = 1
      @eve.orientation = 'WEST'
      @eve.placed      = true
      
      @eve.report.should == '1,1,WEST'
    end
  end
  
  describe "#move!" do  
    it "moves the toy robot to the expected position" do
      @eve.x           = 0
      @eve.y           = 0
      @eve.orientation = 'NORTH'
      @eve.placed      = true
      
      @eve.move!('PLACE 1,2,WEST')  
      @eve.report.should == '1,2,WEST'  
    end
  end
  
end

