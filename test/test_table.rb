require 'minitest_helper'
require_relative '../lib/r3d3/table'

class TestTable < Minitest::Test

  def test_move_forbidden
    table = Table.new
    assert table.forbid_move?(-1, 2)
    assert table.forbid_move?(1, -1)
    assert table.forbid_move?(0, 6)
  end

  def test_allowed_move
    table = Table.new
    assert_equal(table.forbid_move?(1, 1), false)
  end

end
