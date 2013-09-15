require 'validations'

class Robot
  attr_accessor :placed,
                :x,
                :y,
                :orientation
  
  ORIENTATIONS = ['NORTH', 'EAST', 'SOUTH', 'WEST']              
  def initialize
    @placed = false
    @x = nil
    @y = nil
    @orientation = ''
  end
  
  def move!(movement)
    p 'movement: ' + movement
    if movement =~ Validations::PLACE_MOVE
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
    
    case movement
    when 'MOVE'
      if @x == 0 && @orientation == 'WEST'
        p 'dangerous move'
        return
      elsif @x == 4 && @orientation == 'EAST'
        p 'dangerous move'
        return
      elsif @y == 0 && @orientation == 'SOUTH'
        p 'dangerous move'
        return
      elsif @y == 4 && @orientation == 'NORTH'
        p 'dangerous move'
        return
      end
        
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