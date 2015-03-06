require_relative 'table'
require_relative 'robot'

class World

  attr_accessor :table, :robot

  def initialize
    # One world contains only a single table and a single Robot
    @table ||= Table.new
    @robot ||= Robot.new
  end

end
