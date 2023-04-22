# frozen_string_literal: true

# linked list class
class LinkedList
  attr_accessor :value, :list

  def initialize(value = nil)
    if value.nil?
      @head = nil
    else
      @head = Node.new(value)
    end
  end

  def inspect_list
    p @head.pointer
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      @head.pointer = Node.new(value)
    end
  end
end

# nodes for linked lists
class Node
  attr_accessor :data, :pointer

  def initialize(data = nil, pointer = nil)
    @data = data
    @pointer = pointer
  end

  def inspect_value
    puts "#{data} -> #{pointer}"
  end
end

linked = LinkedList.new(5)
linked.inspect_list
linked.append(19)
linked.inspect_list
