require 'toystory'

module Validations

  def validate_movement(movement)
    true if (Toystory::SIMPLE_MOVES.include? movement) || (movement =~ /PLACE {1}[0-4],[0-4],(NORTH|SOUTH|EAST|WEST)/)
  end
end