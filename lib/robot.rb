require 'validations'

class Robot
  include Validations

  ORIENTATIONS = ['NORTH', 'EAST', 'SOUTH', 'WEST']              
  
  attr_accessor :placed,
                :x,
                :y,
                :orientation,
                :log
  
  def initialize
    @placed      = false
    @x           = nil
    @y           = nil
    @orientation = ''
    @log         = ''
  end
  
  def move!(movement)
    movement.chomp!
    @log = 'movement: ' + movement
    
    if valid_syntax(movement)    
      if movement.start_with? 'PLACE'
        place(movement)
      elsif safe_move(movement)
        self.send(movement.downcase)
      end
    end
    
    logger = Methadone::CLILogger.new
    logger.info(@log)
    @log = ''
  end
  
  def place(movement)
    position = movement.split(' ')[1].split(',')
    
    @x           = position[0].to_i
    @y           = position[1].to_i
    @orientation = position[2]
    @placed      = true
  end
  
  def move
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
  end
  
  def left
    orientation_index = ORIENTATIONS.index(@orientation) - 1
    @orientation = ORIENTATIONS[orientation_index.modulo(4)]
  end
  
  def right
    orientation_index = ORIENTATIONS.index(@orientation) + 1
    @orientation = ORIENTATIONS[orientation_index.modulo(4)]
  end

  public
  
  def report
    @log = @placed ? "#{@x},#{@y},#{@orientation}" : 'Not placed yet'
  end
end