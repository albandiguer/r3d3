require 'minitest_helper'
require_relative '../lib/r3d3/models/robot'

class TestRobot < Minitest::Test

  def test_place
    robot.place(1,2,'WEST')
    assert_equal([robot.x, robot.y, robot.direction], [1,2,'WEST'])
  end

  def test_move_possible
    robot.move(double.expect(:forbid_move?, false, [0, 1]))
    assert_equal([robot.x, robot.y], [0, 1])
  end

  def test_move_impossible
    robot.move(double.expect(:forbid_move?, true, [0, 1]))
    assert_equal([robot.x, robot.y], [0, 0])
  end

  def test_move_direction
    robot = Robot.new('2', '2', 'WEST')
    robot.move(double.expect(:forbid_move?, false, [Integer, Integer]))
    assert_equal([robot.x, robot.y], [1, 2])
  end

  def test_turn_right
    robot.turn_right
    assert_equal(robot.direction, 'EAST')
  end

  def test_turn_left
    robot.turn_left
    assert_equal(robot.direction, 'WEST')
  end

  def test_report
    assert_equal(robot.report, '0,0,NORTH')
  end

private 

  def double
    MiniTest::Mock.new
  end

  def robot
    @robot ||= Robot.new
  end

end
