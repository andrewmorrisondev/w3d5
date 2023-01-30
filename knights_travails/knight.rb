require_relative './skeleton/lib/00_tree_node.rb'

class KnightPathFinder

  def initialize(pos)
    @considered_positions = [pos]
    self.root_node = PolyTreeNode.new(pos)
    self.build_move_tree
  end

  def self.valid_moves(pos) # [3,3]
    valid_moves_arr = []
    move_equations = [
      [-1, -2], 
      [-1, 2], 
      [1, -2], 
      [1, 2], 
      [-2, -1], 
      [-2, 1], 
      [2, -1], 
      [2, 1]
    ]
    move_equations.each do |equation|
      pos_x = pos[0]
      pos_y = pos[1]
      eq_x = equation[0]
      eq_y = equation[1]

      new_x = pos_x + eq_x
      new_y = pos_y + eq_y 


      if (new_x <= 7 && new_x >= 0) && (new_y <= 7 && new_y >= 0)
        valid_moves_arr << [new_x, new_y]
      end
      valid_moves_arr
    end
  end

  def new_move_positions(pos)
    KnightPathFinder.valid_moves(pos).each do |el|
      @considered_positions << pos if !@considered_positions.include?(pos)
    end
    return @considered_positions
  end

  def build_move_tree
    queue = [PolyTreeNode.new(start_pos)]
    until queue.empty?
      new_move_positions(queue.shift.value)
      @considered_positions.each do |el|
        queue << PolyTreeNode.new(el)
      end
    end
  end
          
                            ###### PART II ########

  def find_path()
    
  end
end