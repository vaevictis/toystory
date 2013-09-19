require_relative '../lib/robot'
require_relative '../lib/validations'

describe Robot do
  before(:each) do
    @table = double('table').as_null_object
    @eve  = Robot.new(@table)
  end
  
  describe "#report" do
    it "reports the robot position when not placed yet" do
      @eve.report.should == "report: Not placed yet"
    end
    
    it "reports the robot position when placed" do
      @eve.x           = 1
      @eve.y           = 1
      @eve.orientation = 'WEST'
      @eve.placed      = true
      
      @eve.report.should == 'report: 1,1,WEST'
    end
  end
  
  describe "#move!" do  
    it "moves the toy robot to the expected position" do
      @eve.x           = 0
      @eve.y           = 0
      @eve.orientation = 'NORTH'
      @eve.placed      = true
      
      @eve.move!('PLACE 1,2,WEST')  
      @eve.report.should == 'report: 1,2,WEST'  
    end
  end
  
  describe "#left" do
    it "turns the robot counterclockwise and keeps the orientation one of four cardinal directions" do
      @table.stub(:size) {9}
      
      @eve.x           = 0
      @eve.y           = 0
      @eve.orientation = 'NORTH'
      @eve.placed      = true

      5.times do
        @eve.left
      end

      @eve.orientation.should == 'WEST'
    end
  end

  describe "#right" do
    it "turns the robot clockwise and keeps the orientation one of four cardinal directions" do
      @eve.x           = 0
      @eve.y           = 0
      @eve.orientation = 'NORTH'
      @eve.placed      = true
    
      21.times do
        @eve.right
      end

      @eve.orientation.should == 'EAST'
    end
  end
  
end

