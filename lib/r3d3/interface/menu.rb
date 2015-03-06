require 'thor'

class Menu < Thor

  desc "place X,Y,Z", "position the robot on the playground"
  def place(position)
    puts position
  end

end
