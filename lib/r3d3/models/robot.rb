require 'matrix'

class Robot

  DIRECTIONS = %w(NORTH EAST SOUTH WEST)
  STEP_DIRECTIONS = {
    NORTH: [0, 1],
    EAST: [1, 0], 
    SOUTH: [0, -1],
    WEST: [-1, 0]
  }

  attr_accessor :x, :y, :direction

  def initialize(x = '0', y = '0', direction = 'NORTH')
    place(x, y, direction)
  end

  def place(x, y, direction)
    @x = x.to_i
    @y = y.to_i
    @direction = direction
    raise 'Direction is not valid' unless DIRECTIONS.include? @direction
  end

  def move(board)
    return if board.forbid_move?(*attempted_move)
    update_position(attempted_move)
  end

  def turn_left
    @direction = DIRECTIONS[current_direction_index - 1]
  end

  def turn_right
    @direction = DIRECTIONS[(current_direction_index + 1) % 4]
  end

  def report
    '%d,%d,%s' % [@x, @y, @direction]
  end

private

  def update_position(new_coordinates)
    @x, @y = new_coordinates
  end

  def attempted_move
    (Matrix[coordinates] + Matrix[STEP_DIRECTIONS[@direction.to_sym]]).to_a.first
  end

  def current_direction_index
    DIRECTIONS.find_index(@direction)
  end

  def coordinates
    [@x, @y]
  end
  
end
