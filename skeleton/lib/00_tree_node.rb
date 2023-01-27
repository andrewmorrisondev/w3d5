require "byebug"

class PolyTreeNode
    attr_reader :parent, :children, :value
    attr_writer :parent, :children

    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(new_parent)
        debugger
        if parent != nil # adoptive
            parent.children.delete(self)
            parent = new_parent
            parent.children << self if !parent.children.include?(self)
        elsif parent != nil && new_parent == nil
            parent.children.delete(self)
            parent = new_parent
        else
            parent = new_parent
            parent.children << self if !parent.children.include?(self)
        end
    end

    
end