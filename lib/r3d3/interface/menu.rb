require_relative '../models/world'

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
    # instantiate_world
    # play_now
    instantiate_world
    print_commands 
  end

private 

  def instantiate_world
    @world = World.new
  end

# TODO
  def play_now
    # make a world
    # print_commands
  end

  def print_commands
    puts 'Use the following commands:'
    puts %q(
      PLACE X,Y,F
      MOVE
      LEFT
      RIGHT
      REPORT
      EXIT
    )
  end

end
