require_relative '../skeleton/lib/00_tree_node.rb'

class KnightPathFinder

  attr_accessor :root_node

  def initialize(pos)
    @considered_positions = [pos]
    @root_node = PolyTreeNode.new(pos)
    self.build_move_tree
  end

  def self.valid_moves(pos) # [3,3]
    # debugger
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
      p valid_moves_arr
      valid_moves_arr
    end
  end

  def new_move_positions(pos)
    out_arr = []
    KnightPathFinder.valid_moves(pos).each do |el|
      if !@considered_positions.include?(el)
        @considered_positions << el
      end
      if !@considered_positions.include?(el)
        out_arr << el
        # p el
      end
    end
    return out_arr
  end

  def build_move_tree
    queue = [@root_node]
    until queue.empty?
      arr = new_move_positions(queue.shift.value)
      arr.each do |el|
        queue << PolyTreeNode.new(el)
      end
    end
    puts @considered_positions.length
  end

          
###### PART II ########

  def find_path(end_pos)
    # self.bfs(end_pos)
  end
end

kpf = KnightPathFinder.new([0, 0])
kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]