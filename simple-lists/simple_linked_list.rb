class Node
  attr_accessor :data, :next

  def initialize(data, next_node = nil)
    @data = data
    @next = next_node
  end
end

class LinkedList
  attr_accessor :head

  def initialize(data)
    @head = Node.new(data)
  end

  def index_at(index)
    current_pointer = head
    index.times do 
      return nil unless current_pointer.next
      current_pointer = current_pointer.next
    end
    current_pointer.data
  end

  def insert_at_index(index, data)
    current_pointer = self.head
    (1..index - 1).each do |number|
      if current_pointer.next.nil? && (index != number)
        current_pointer.next = Node.new(nil, nil)
      end
      current_pointer = current_pointer.next
    end
    if current_pointer
      old_next = current_pointer.next 
      current_pointer.next = Node.new(data, old_next) 
    end
  end

  def unshift(data)
    current_pointer = self.head
    self.head = Node.new(data)
    self.head.next = current_pointer 
  end

  def push(data)
    current_pointer = head
    while current_pointer.next
      current_pointer = current_pointer.next
    end
    current_pointer.next = Node.new(data, nil)
  end
end
