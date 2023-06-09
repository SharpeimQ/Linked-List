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

  def to_s
    if @head.nil?
      puts 'empty list'
    else
      node = @head
      until node.nil?
        print "(#{node.data}) -> "
        node = node.next_value
      end
      print "nil\n"
    end
  end

  def append(value)
    return @head = Node.new(value) if @head.nil?

    @head = append_h(@head, value)
  end

  def append_h(node, value)
    return Node.new(value) if node.nil?

    node.next_value = append_h(node.next_value, value)
    # executed during unwinding
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

  def tail
    node = @head
    until node.next_value.nil?
      node = node.next_value
    end
    puts node.data
  end

  def at(index)
    i = 0
    node = @head
    until i == index
      node = node.next_value
      i += 1
    end
    puts node.data
  end

  def pop
    return nil if @head.nil?

    @head = pop_h(@head)
  end

  def pop_h(node)
    return nil if node.next_value.nil?

    node.next_value = pop_h(node.next_value)
    node
  end

  def contains?(value)
    return false if @head.nil?

    result = false
    node = @head
    until node.nil?
      node.data == value ? result = true : result
      node = node.next_value
    end
    puts result
  end

  def find(value)
    return false if @head.nil?

    count = 0
    node = @head
    until node.nil?
      break if node.data == value

      count += 1
      node.next_value.nil? ? count = nil : nil
      node = node.next_value
    end
    p count
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
linked.append('a')
linked.append('b')
linked.append('c')
linked.append('d')
linked.find('10')
linked.to_s
