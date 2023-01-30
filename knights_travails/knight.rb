require_relative './skeleton/lib/00_tree_node.rb'

class KnightPathFinder
  
  def build_move_tree
    
  end

  def initialize(pos)
    @considered_positions = [pos]
    self.root_node = PolyTreeNode.new(pos)
    self.build_move_tree
  end

  def self.valid_moves(pos) # [3,3]
    move_equations = [[-1, -2], [-1, 2], [1, -2], [1, 2], [-2, -1], [-2, 1], [2, -1], [2, 1]]
    move_equations.each do |equation|
      pos_x = pos[0]
      pos_y = pos[1]
      eq_x = equation[0]
      eq_y = equation[1]

      if (pos_x + eq_x <= 7 && pox_x + eq_x >= 0) && (pos_y + eq_y <= 7 && pox_y + eq_y >= 0)
        return true
        
      else  
        return false 
      end
        # << PolyTreeNode.new([pos_x + eq_x, pos_y + eq_y])

    end
  end

  def new_move_positions(pos)
    if !@considered_positions.include?(pos)
      self.valid_moves(pos)
      @considered_positions << pos
      return pos
    end
  end


end