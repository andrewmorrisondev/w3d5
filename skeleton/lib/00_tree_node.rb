class PolyTreeNode
    attr_reader :parent, :children, :value

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(new_value)
        parent = new_value
        parent.children << new_value if parent != nil
    end
end