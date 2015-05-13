class Deque
  attr_accessor :list
 
  def initialize
    @list = nil
  end
 
  def push(datum)
    if self.list
      last_element = self.list.get_last_element
      last_element.next = Element.new(datum)
    else
      self.list = Element.new(datum)
    end
    self.list
  end
 
  def pop
    second_to_last_element, last_element = self.list.get_last_two_elements
    last_element.previous = nil if last_element
    second_to_last_element.next = nil if second_to_last_element
    last_element.datum
  end
 
  def shift
    old_head = self.list
    if self.list.next
      self.list = old_head.next
      self.list.previous = nil
    end
    old_head.next = nil
    old_head.datum
  end
 
  def unshift(datum)
    self.list = Element.new(datum, self.list)
  end
 
end