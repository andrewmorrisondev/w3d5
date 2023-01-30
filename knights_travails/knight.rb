require_relative './skeleton/lib/00_tree_node.rb'

class KnightPathFinder
  
  def build_move_tree

  end

  def initialize(pos)
    @considered_positions = [pos]
    self.root_node = PolyTreeNode.new(pos)
    self.build_move_tree
  end

  def self.valid_moves(pos)
    
  end

  def new_move_positions(pos)
    if !considered_positions.include?(pos)
      self.valid_moves(pos)
      @considered_positions += pos
      return pos
    end
  end


end