class Table
  DEFAULT_TABLE_SIZE = 5
  
  attr_accessor :size
  
  def initialize(table_size = DEFAULT_TABLE_SIZE)
    @size = table_size
  end
end