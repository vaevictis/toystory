require 'validations'

class Table  
  attr_accessor :size
  
  def initialize(table_size = Validations::DEFAULT_TABLE_SIZE)
    @size = table_size
  end
end