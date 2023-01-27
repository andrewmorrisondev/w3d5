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
        # debugger
        if parent != nil # adoption - remove old parent, add new parent
            parent.children.delete(self)
            @parent = new_parent
            parent.children << self if !parent.children.include?(self)
        elsif parent != nil && new_parent == nil # orpan - remove parent
            parent.children.delete(self)
            @parent = new_parent
        else  # emancipation - 
            @parent = new_parent
            parent.children << self if !parent.children.include?(self)
        end
    end

    
end