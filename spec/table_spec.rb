require_relative '../lib/table'

describe Table do
  
  it "initializes the table with a default size" do
    table = Table.new
    table.size.should == 5
  end
  
  it "initializes the table with the optional size" do
    table = Table.new(9)
    table.size.should == 9
  end

end
