class Table

  def initialize(dimension = 5)
    @dimension = dimension 
  end

  def forbid_move?(x, y)
    coordinate_out_of_range?(x) || coordinate_out_of_range?(y)
  end

private

  def coordinate_out_of_range?(coordinate)
    not (0..@dimension-1).include? coordinate
  end

end

