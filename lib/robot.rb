require 'validations'

class Robot
  include Validations
  
  attr_accessor :placed,
                :x,
                :y,
                :orientation
  
  ORIENTATIONS = ['NORTH', 'EAST', 'SOUTH', 'WEST']              
  def initialize
    @orientation = ''
    @placed      = false
    @x           = nil
    @y           = nil
  end
  
  def move!(movement)
    movement.chomp!
  
    return unless valid_syntax(movement)
    
    # log
    p 'movement: ' + movement
    
    if movement =~ PLACE_MOVE
      position = movement.split(' ')[1].split(',')
      @x = position[0].to_i
      @y = position[1].to_i
      @orientation = position[2]
      @placed = true
      return
    end
    
    if !@placed
      p 'Not placed yet'
      return
    end

    # If reaching here, robot is placed

    case movement
    when 'MOVE'
      return unless safe_move(movement)
      
      case @orientation
      when 'NORTH'
        @y += 1
      when 'SOUTH'
        @y -= 1
      when 'WEST'
        @x -= 1
      when 'EAST'
        @x += 1
      end
      
    when 'LEFT'
      orientation_index = ORIENTATIONS.index(@orientation) - 1
      
      if orientation_index < 0
        orientation_index += 4
      end
      @orientation = ORIENTATIONS[orientation_index]
      
    when 'RIGHT'
      orientation_index = ORIENTATIONS.index(@orientation) + 1
      if orientation_index > 3
        orientation_index -= 4
      end
      @orientation = ORIENTATIONS[orientation_index]
      
    when 'REPORT'
      report
    end
  end
  
  def report
    if @placed
      p "#{@x},#{@y},#{@orientation}"
    else
      'NOT placed'
    end
  end
end