class PolyTreeNode
    attr_reader :value
    attr_accessor :parent, :children

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(new_parent)
        if self.parent != nil # adoptive
            self.parent.children.delete(self)
            self.parent = new_parent
        end
        self.parent = node
        node.children << self if node != nil
    end

    
end