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
    if @head.nil?
      puts 'empty list'
    else
      node = @head
      until node.nil?
        print "#{node.data} -> "
        node = node.next_value
      end
      print "nil\n"
    end
  end

  def append(value)
    return @head = Node.new(value) if @head.nil?

    @head = traversal(@head, value)
  end

  def traversal(node, value)
    return Node.new(value) if node.nil?

    node.next_value = traversal(node.next_value, value)
    node
  end

  def prepend(value)
    if @head.nil?
      @head = Node.new(value)
    else
      node = @head
      @head = Node.new(value)
      @head.next_value = node
    end
  end

  def size
    count = 0
    node = @head
    until node.nil?
      node = node.next_value
      count += 1
    end
    puts count
  end
end

# nodes for linked lists
class Node
  attr_accessor :data, :next_value

  def initialize(data = nil, next_value = nil)
    @data = data
    @next_value = next_value
  end

  def inspect_value
    puts "#{data} -> #{next_value.data}"
  end
end

linked = LinkedList.new
linked.prepend(20)
linked.prepend(21)
linked.append(5)
linked.append(10)
linked.size
linked.inspect_list
