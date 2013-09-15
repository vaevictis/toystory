require 'Methadone'

module Validations
  SIMPLE_MOVES = ['MOVE','LEFT','RIGHT','REPORT']
  PLACE_MOVE   = /PLACE {1}[0-4],[0-4],(NORTH|SOUTH|EAST|WEST)/
  
  
  def valid_syntax(movement)
    # it's not technically syntax only, as the 
    # coordinates validity is also checked here.
    if (SIMPLE_MOVES.include? movement) || (movement =~ PLACE_MOVE)
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
      || (@x == 4 && @orientation == 'EAST')  \
      || (@y == 0 && @orientation == 'SOUTH') \
      || (@y == 4 && @orientation == 'NORTH')

      @log = 'Dangerous move'
      false
    else
      true
    end
  end
  
end