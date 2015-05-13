class Element
  
  def self.to_a(element)
    container = []
    return container if element.nil?
    pointer = element
    while pointer.datum
      container << pointer.datum
      pointer.next ? pointer = pointer.next : break
    end
    container
  end
 
  def self.from_a(array)
    head = nil
    array.each do |val|
      if head.nil?
        head = self.new(val)
      else
        last_element = head.get_last_element
        last_element.next = Element.new(val)
      end
    end
    head
  end
  
  attr_accessor :datum, :value
  attr_reader :next, :previous
 
  def next=(element)
    @next = element
    if element && element.previous.nil?
      element.previous = self
    end
  end
 
  def previous=(element)
    @previous = element
    if element && element.next.nil?
      element.next = self
    end
  end
 
  def initialize(datum, next_one=nil)
    @datum = datum
    self.next=(next_one)
  end
 
  def to_a
    self.class.to_a(self)
  end
 
  def reverse
    current = Element.new(self.datum, nil)
    if self.next
      next_element = Element.new(self.next.datum, self.next.next)
    end
    while next_element
      next_next_element = next_element.next
      new_next_element = Element.new(next_element.datum, current)
      current = new_next_element
      next_element = next_next_element
    end
    current
  end
 
  def get_last_two_elements
    last_element = self
    second_to_last_element = nil
    while last_element.next
      second_to_last_element = last_element
      last_element = last_element.next
    end
    [second_to_last_element, last_element]
  end
 
  def get_last_element
    last_element = self
    while last_element.next
      last_element = last_element.next
    end
    last_element
  end
 
end