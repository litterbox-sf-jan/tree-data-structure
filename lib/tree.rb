require 'pry'
class Node
  attr_accessor :left, :right

  attr_reader :value

  def initialize value
    @value = value
    @left = @right = nil
  end
end

class Tree
  attr_reader :root
  
  def initialize value
    @root = Node.new value
  end

  def insert value, root = nil
    root ||= @root 

    if value < root.value && root.left
      insert value, root.left
    elsif value > root.value && root.right
      insert value, root.right
    elsif value < root.value
      root.left = Node.new value
    elsif value > root.value
      root.right = Node.new value
    end
  end
end
