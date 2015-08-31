require "pry"

class BST
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
  end

  def insert(element)
    if element > @data
      @right.nil? ? @right = BST.new(element) : @right.insert(element)
    else
      @left.nil? ? @left = BST.new(element) : @left.insert(element)
    end
  end

  def each
    sorted_list = [@data]

    left_node = self
    right_node = self

    while left_node.left do 
      left_node = left_node.left
      sorted_list.unshift(left_node.right.data) if left_node.right
      sorted_list.unshift(left_node.data)
    end

    
    while right_node.right do 
      right_node = right_node.right
      sorted_list.push(right_node.left.data) if right_node.left
      sorted_list.push(right_node.data)
    end

    sorted_list.each do |data|
      yield(data)
    end
  end

end