require_relative '../lib/robot'

describe Robot do
  before(:each) do
    @eve = Robot.new
  end
  
  describe "#report" do
    it "reports the robot position when not positioned yet" do
      @eve.report.should == "NOT POSITIONED"
    end
    
    it "reports the robot position when positioned" do
      @eve.x = 1
      @eve.y = 1
      @eve.orientation = 'WEST'
      @eve.positioned  = true
      
      @eve.report.should == '1,1,WEST'
    end
  end
  
  describe "#move!" do  
    it "moves the toy robot to the expected position" do
      @eve.x = 0
      @eve.y = 0
      @eve.orientation = 'NORTH'
      @eve.positioned  = true
      
      @eve.move!('PLACE 1,2,WEST')  
      @eve.report.should == '1,2,WEST'  
    end
  end
  
end

