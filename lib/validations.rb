require 'Methadone'

module Validations
  SIMPLE_MOVES       = ['MOVE','LEFT','RIGHT','REPORT']
  DEFAULT_TABLE_SIZE = 5
  
  def valid_syntax(movement, table_size = DEFAULT_TABLE_SIZE)
    # it's not technically syntax only, as the 
    # coordinates validity is also checked here.
    
    place_move_regex = /PLACE {1}[0-#{table_size.to_s}],[0-#{table_size.to_s}],(NORTH|SOUTH|EAST|WEST)/

    if (SIMPLE_MOVES.include? movement) || (movement =~ place_move_regex)
      true
    else
      @log = 'Invalid syntax'
      false
    end
  end
  
  def safe_move(movement)
    if !@placed
      @log = "Not placed yet"
      return false
    end
    
    return true if movement != 'MOVE'

    # Robot is on a side and facing the void
    if (@x == 0 && @orientation == 'WEST' )   \
      || (@x == @table.size - 1 && @orientation == 'EAST')  \
      || (@y == 0 && @orientation == 'SOUTH') \
      || (@y == @table.size - 1 && @orientation == 'NORTH')

      @log = 'Dangerous move'
      false
    else
      true
    end
  end
  
end