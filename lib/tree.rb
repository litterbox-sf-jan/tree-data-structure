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

  def pre_order root = nil, values = []
    root ||= @root
    values << root.value
    pre_order root.left, values if root.left
    pre_order root.right, values if root.right
    values
  end

  def pre_order_find root = nil, search_for = nil
  end

  def in_order root = nil, values = []
    root ||= @root
    in_order root.left, values if root.left
    values << root.value
    in_order root.right, values if root.right
    values
  end

  def post_order root = nil, values = []
    root ||= @root
    post_order root.left, values if root.left
    post_order root.right, values if root.right
    values << root.value
  end

  def level_order
    queue = []
    values = []
    queue << @root

    while !queue.empty?
      node = queue.shift
      values << node.value
      queue << node.left if node.left
      queue << node.right if node.right
    end

    values
  end

  def find value, root = nil
    root ||= @root
    @found = false
    if root.value == value
      @found = true
      return @found
    end
    find value, root.left if root.left && !@found
    find value, root.right if root.right && !@found
    @found
  end
end
