require 'minitest_helper'
require_relative '../lib/r3d3/robot'
require_relative '../lib/r3d3/table'

class TestR3d3 < Minitest::Test

  def test_that_it_has_a_version_number
    refute_nil ::R3d3::VERSION
  end

  #PLACE 0,0,NORTH
  #MOVE
  #REPORT
  #Output: 0,1,NORTH
  def test_scenario1 
    r = robot
    r.move(table)
    assert_equal('0,1,NORTH', r.report)
  end

  # PLACE 0,0,NORTH
  # LEFT
  # REPORT
  # Output: 0,0,WEST
  def test_scenario2
    r = robot
    r.turn_left
    assert_equal('0,0,WEST', r.report)
  end

  # PLACE 1,2,EAST
  # MOVE
  # MOVE
  # LEFT
  # MOVE
  # REPORT
  # Output: 3,3,NORTH
  def test_scenario3
    r = Robot.new(1, 2, 'EAST')
    r.move(table)
    r.move(table)
    r.turn_left
    r.move(table)
    assert_equal('3,3,NORTH', r.report)
  end


private

  def table
    Table.new
  end

  def robot
    Robot.new
  end
end
