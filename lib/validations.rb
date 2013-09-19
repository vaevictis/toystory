require 'Methadone'

module Validations
  SIMPLE_MOVES = ['MOVE','LEFT','RIGHT','REPORT']

  PLACE_MOVE ||= /PLACE {1}[0-4],[0-4],(NORTH|SOUTH|EAST|WEST)/

  # regexp = Regexp.new "PLACE {1}[0-#{table.size.to_s}],[0-#{table.size.to_s}],(NORTH|SOUTH|EAST|WEST)"

  # self.const_set('PLACE_MOVE', regexp)
  
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
    true
    # if !@placed
#       @log = "Not placed yet"
#       return false
#     end
#     
#     return true if movement != 'MOVE'
# 
#     # Robot is on a side and facing the void
#     if (@x == 0 && @orientation == 'WEST' )   \
#       || (@x == @table.size && @orientation == 'EAST')  \
#       || (@y == 0 && @orientation == 'SOUTH') \
#       || (@y == @table.size && @orientation == 'NORTH')
# 
#       @log = 'Dangerous move'
#       false
#     else
#       true
#     end
  end
  
end