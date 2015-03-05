require 'minitest_helper'
require_relative '../lib/r3d3/robot'

class TestRobot < Minitest::Test

  def test_move_possible
    robot = Robot.new('0', '0', 'NORTH')
    robot.move(double.expect(:forbid_move?, false, [0, 1]))
    assert_equal([robot.x, robot.y], [0, 1])
  end

  def test_move_impossible
    robot = Robot.new('0', '0', 'NORTH')
    robot.move(double.expect(:forbid_move?, true, [0, 1]))
    assert_equal([robot.x, robot.y], [0, 0])
  end

  def test_move_direction
    robot = Robot.new('2', '2', 'WEST')
    robot.move(double.expect(:forbid_move?, false, [Integer, Integer]))
    assert_equal([robot.x, robot.y], [1, 2])
  end

  def test_turn_right
    robot = Robot.new('0', '0', 'NORTH')
    robot.turn_right
    assert_equal(robot.direction, 'EAST')
  end

  def test_turn_left
    robot = Robot.new('0', '0', 'NORTH')
    robot.turn_left
    assert_equal(robot.direction, 'WEST')
  end

  def test_report
    robot = Robot.new('0', '0', 'NORTH')
    assert_equal(robot.report, '0,0,NORTH')
  end

private 

  def double
    MiniTest::Mock.new
  end

end
