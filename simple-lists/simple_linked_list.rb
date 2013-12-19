class Element
  attr_accessor :datum, :next_elem

  def initialize(datum, next_elem)
    @datum = datum
    @next_elem = next_elem
  end

  def next
    self.next_elem
  end

  def next=(elem)
    self.next_elem = elem
  end

  def self.to_a(elem)
    temp = []
    current = elem
    while current
      temp << current.datum
      current = current.next
    end
    temp
  end

  def to_a
    temp = []
    current = self
    while current
      temp << current.datum
      current = current.next
    end
    temp
  end

  def reverse
    # reverses the elements connected via next
    return Element.new(self.next.datum, self) if self.next
    self
  end

  def self.from_a(array)
    return nil if array.size == 0
    current = nil
    next_elem = nil
    root = nil
    array.each do |value|
      if current
        next_elem = Element.new(value, nil)
        current.next = next_elem
        current = next_elem
      else
        current = Element.new(value, nil)
        root = current
      end
    end
    root
  end

end