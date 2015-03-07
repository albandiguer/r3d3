require_relative '../models/world'
require 'highline/import'

class Menu

  def initialize
    puts "\e[32mWelcome in toy robot simulator!\e[0m"
    puts %q(
             _
            [ ]
           (   )
            |>|
         __/===\__
        //| o=o |\\
      <]  | o=o |  [>
          \=====/
         / / | \ \
        <_________>
    )
    instantiate_world
    print_commands 
  end

private 

  def instantiate_world
    @world = World.new
  end

  def print_commands
    loop do
      choose do |menu|
        menu.layout = :menu_only
        menu.shell  = true

        menu.choice(:PLACE, "Position the robot with X,Y,DIRECTION.") do |command, details|
          @world.robot.place(*details.split(','))
        end
        menu.choice(:MOVE, "Move the robot.") do |command|
          @world.robot.move(@world.table)
        end
        menu.choice(:LEFT, "Turn the robot to the left.") do |command|
          @world.robot.turn_left
        end
        menu.choice(:RIGHT, "Turn the robot to the right.") do |command|
          @world.robot.turn_right
        end
        menu.choice(:REPORT, "Show the position of the robot.") do |command|
          say(@world.robot.report)
        end
        menu.choice(:quit, "Exit program.") { exit }
      end
    end
  end

end
