# frozen_string_literal: true

# linked list class
class LinkedList
end

# nodes for linked lists
class Node
  attr_accessor :value

  def initialize(value, point = nil)
    @value = value
    @point = point
  end
end

test_node = Node.new('5')
puts test_node.value
