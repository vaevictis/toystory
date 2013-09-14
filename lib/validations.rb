module Validations
  SIMPLE_MOVES = ['MOVE','LEFT','RIGHT','REPORT']
  PLACE_MOVE   = /PLACE {1}[0-4],[0-4],(NORTH|SOUTH|EAST|WEST)/
  
  def validate_movement(movement)
    validate_syntax(movement) && validate_safety(movement)
  end
  
  private
  def validate_syntax(movement)
    (SIMPLE_MOVES.include? movement) || (movement =~ PLACE_MOVE)
  end
  
  def validate_safety(movement)
    true
  end
end