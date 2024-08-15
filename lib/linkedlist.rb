# frozen_string_literal: true

require_relative 'node'

class LinkedList
  def initialize
    @head = nil
  end

  def append(data)
    if @head.nil?
      @head = Node.new(data)
    else
      current_node = @head
      current_node = current_node.next_node until current_node.next_node.nil?
      current_node.next_node = Node.new(data)
    end
  end

  def prepend(data)
    if @head.nil?
      @head = Node.new(data)
    else
      new_node = Node.new(data)
      new_node.next_node = @head
      @head = new_node
    end
  end

  def size
    return 0 if @head.nil?

    count = 1
    current_node = @head
    until current_node.next_node.nil?
      current_node = current_node.next_node
      count += 1
    end

    count
  end

  def head
    return nil if @head.nil?

    @head
  end

  def tail
    return nil if @head.nil?

    current_node = @head
    current_node = current_node.next_node until current_node.next_node.nil?
    current_node
  end

  def at(index)
    return nil if @head.nil?

    count = 0
    current_node = @head
    until count == index
      current_node = current_node.next_node
      count += 1
    end
    current_node
  end

  def pop
    return nil if @head.nil?

    current_node = @head
    previous_node = nil

    until current_node.next_node.nil?
      previous_node = current_node
      current_node = current_node.next_node
    end
    previous_node.next_node = nil
  end

  def contains?(val)
    return 0 if @head.nil?

    current_node = @head
    until current_node.next_node.nil?
      return true if current_node.value == val

      current_node = current_node.next_node
    end
    false
  end

  def find(val)
    return nil if @head.nil?

    index = 0
    current_node = @head
    until current_node.next_node.nil?
      return index if current_node.value == val

      current_node = current_node.next_node
      index += 1
    end
    nil
  end

  def to_s
    return nil if @head.nil?

    current_node = @head
    str = ''
    list_size = size
    list_size.times do
      str = "#{str} ( #{current_node.value} ) ->"
      current_node = current_node.next_node
    end
    "#{str} nil"
  end

  def insert_at(value, index)
    return nil if @head.nil?

    count = 0
    current_node = @head
    until count == index
      previous_node = current_node
      current_node = current_node.next_node
      count += 1
    end
    next_node = current_node
    current_node = Node.new(value)
    previous_node.next_node = current_node
    current_node.next_node = next_node
  end

  def removed_at(index)
    return nil if @head.nil?

    count = 0
    current_node = @head
    until count == index
      previous_node = current_node
      current_node = current_node.next_node
      count += 1
    end
    node = current_node.next_node
    previous_node.next_node = node
  end
end
