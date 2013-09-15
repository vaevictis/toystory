module Validations
  SIMPLE_MOVES = ['MOVE','LEFT','RIGHT','REPORT']
  PLACE_MOVE   = /PLACE {1}[0-4],[0-4],(NORTH|SOUTH|EAST|WEST)/
  
  
  def valid_syntax(movement)
    if (SIMPLE_MOVES.include? movement) || (movement =~ PLACE_MOVE)
      true
    else
      p 'Invalid syntax'
      false
    end
  end
  
  def safe_move(movement)
    # Robot is on a side and facing the void
    if (@x == 0 && @orientation == 'WEST' )   \
      || (@x == 4 && @orientation == 'EAST')  \
      || (@y == 0 && @orientation == 'SOUTH') \
      || (@y == 4 && @orientation == 'NORTH')

      p 'Dangerous move'
      false
    else  
      true
    end
  end
  
end